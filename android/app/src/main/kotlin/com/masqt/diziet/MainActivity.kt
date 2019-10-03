package com.masqt.diziet

import android.os.Bundle
import com.masqt.diziet.Constants.CHANNEL_NAME_TELEPHONY

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.JSONMessageCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private lateinit var telephonyPlatformChannelTransceiver: TelephonyPlatformChannelTransceiver

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        // Create a communicator for two-way comms between here and the Flutter client
        telephonyPlatformChannelTransceiver = TelephonyPlatformChannelTransceiver(this)
    }

    /**
     * Perform platform-specific behaviour for answering a call invite
     */
    fun answerCallInvite() {
        TODO("Not implemented yet")
    }

    /**
     * Perform platform-specific behaviour for rejecting a call invite
     */
    fun rejectCallInvite() {
        TODO("Not implemented yet")
    }
}
