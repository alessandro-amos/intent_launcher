package flutter.plugin.intent_launcher

import android.app.Activity
import android.content.ComponentName
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import android.util.Base64
import android.util.Log
import androidx.core.os.bundleOf
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.ByteArrayOutputStream

class IntentLauncherPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel : MethodChannel
    private var activity: Activity? = null
    private var pendingResult: Result? = null
    private val REQUEST_CODE = 12
    private val ATTR_EXTRA = "extra"
    private val ATTR_DATA = "data"

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "intent_launcher")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener { requestCode, resultCode, data ->
            if (requestCode == 12) {
                try {
                    val extraMap = data?.extras?.let { convertBundleToMap(it) }
                    pendingResult?.success(mapOf(
                        "resultCode" to resultCode,
                        "data" to data?.toString(),
                        "extra" to extraMap
                    ))
                } catch (e: Exception) {
                    pendingResult?.error("CONVERSION_ERROR", e.message, null)
                }
                pendingResult = null
                true
            } else {
                false
            }
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        Log.i("TESTE", call.method)
        when (call.method) {
            "startActivity" -> handleStartActivity(call, result)
            else -> result.notImplemented()
        }
    }

    private fun handleStartActivity(call: MethodCall, result: Result) {
        if (pendingResult != null) {
            result.error("ALREADY_STARTED", "Another activity is already pending.", null)
            return
        }

        val args = call.arguments as Map<*, *>
        val activityAction = args["activityAction"] as String
        val params = args["params"] as? Map<*, *>

        val intent = Intent(activityAction)

        params?.let {
            setupIntent(intent, it)
        }

        try {
            activity?.startActivityForResult(intent, REQUEST_CODE)
            pendingResult = result
        } catch (e: Exception) {
            result.error("FAILED_TO_LAUNCH", e.localizedMessage, null)
        }
    }

    private fun setupIntent(intent: Intent, params: Map<*, *>) {
        (params["className"] as? String)?.let { className ->
            val packageName = params["packageName"] as? String
            intent.component = if (packageName != null) {
                ComponentName(packageName, className)
            } else {
                ComponentName(activity!!, className)
            }
        }

        handleDataAndType(intent, params)
        handleExtras(intent, params)

        (params["flags"] as? Int)?.let { flags -> intent.addFlags(flags) }
        (params["category"] as? String)?.let { category -> intent.addCategory(category) }
    }

    private fun handleDataAndType(intent: Intent, params: Map<*, *>) {
        if (params["data"] != null && params["type"] != null) {
            intent.setDataAndType(
                Uri.parse(params["data"] as String),
                params["type"] as String
            )
        } else {
            intent.apply {
                if (params["data"] != null) {
                    data = Uri.parse(params["data"] as String)
                }
                if (params["type"] != null) {
                    type = params["type"] as String
                }
            }
        }
    }

    private fun handleExtras(intent: Intent, params: Map<*, *>) {
        params["extra"]?.let { extra ->
            if (extra is Map<*, *>) {
                val extras: Map<String, Any?> = extra
                    .filterKeys { it is String }
                    .mapKeys { it.key as String }
                    .mapValues { (_, value) ->
                        when (value) {
                            is Double -> value.toInt()
                            else -> value
                        }
                    }
                intent.putExtras(extras.toBundle())
            }
        }
    }

    private fun convertBundleToMap(bundle: Bundle): Map<String, Any?> {
        val map = mutableMapOf<String, Any?>()
        for (key in bundle.keySet()) {
            val value = bundle.get(key)
            map[key] = when (value) {
                is Bitmap -> convertBitmapToBase64(value)
                else -> value
            }
        }
        return map
    }

    private fun convertBitmapToBase64(bitmap: Bitmap): String {
        val byteArrayOutputStream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)
        val byteArray = byteArrayOutputStream.toByteArray()
        return Base64.encodeToString(byteArray, Base64.DEFAULT)
    }

    private fun Map<String, Any?>.toBundle(): Bundle = bundleOf(*this.toList().toTypedArray())
}