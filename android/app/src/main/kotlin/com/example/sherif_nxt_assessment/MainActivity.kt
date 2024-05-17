package com.example.sherif_nxt_assessment

import io.flutter.embedding.android.FlutterActivity

import android.annotation.SuppressLint
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterFragmentActivity


class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "com.example.sherif_nxt_assessment/bottomSheet"
    @SuppressLint("SuspiciousIndentation")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // method chanel to link flutter with android
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            // to get all the prameters from flutter for the ticket
            val name = call.argument<String>("name")
            val image = call.argument<String>("image")
            val id = call.argument<String>("id")
            val type = call.argument<String>("type")
            val seat = call.argument<String>("seat")
            val isDark = call.argument<Boolean>("isDark")

            showBottomSheet(name,image,id,type,seat,isDark)

        }
    }

// to open the bottom sheet
    @SuppressLint("InflateParams")
    private fun showBottomSheet(
        name: String?,
        image: String?,
        id: String?,
        type: String?,
        seat: String?,
        isDark: Boolean?
    ) {
        val bottomSheetDialog = BottomSheetFragment.newInstance(name,image,id,type,seat,isDark)
        bottomSheetDialog.show(getSupportFragmentManager(), "Bottom Sheet Dialog Fragment")

    }
}