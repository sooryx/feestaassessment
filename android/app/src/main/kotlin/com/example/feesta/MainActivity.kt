package com.example.feesta
import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.feesta/install_time"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getInstallTime") {
                try {
                    val packageInfo = packageManager.getPackageInfo(packageName, 0)
                    val installTime = packageInfo.firstInstallTime
                    result.success(installTime)
                } catch (e: PackageManager.NameNotFoundException) {
                    result.error("ERROR", "Package not found", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
