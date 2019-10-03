package com.masqt.diziet

import android.util.Log
import com.masqt.diziet.Constants.MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE
import com.masqt.diziet.Constants.MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE
import com.masqt.diziet.platformmessages.IncomingCallInvite
import org.json.JSONObject

import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.JSONMessageCodec

/**
 * A class that handles messages between the Android host and the Flutter client.
 */
class TelephonyPlatformChannelTransceiver(private val activity: MainActivity) {
    private val messageChannel: BasicMessageChannel<Any>;

    init {
        // Set up our platform channel back to Flutter
        messageChannel = BasicMessageChannel(
                activity.flutterView,
                Constants.CHANNEL_NAME_TELEPHONY,
                JSONMessageCodec.INSTANCE
        ).also {
            // Set the message handler
            it.setMessageHandler { msg, _ -> handleClientMessage(msg) }
        }
    }

    /**
     * Handle a message from the client
     */
    private fun handleClientMessage(msg: Any?) {
        val obj = msg as JSONObject;
        when (obj["type"]) {
            MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE -> onAcceptIncomingCallInvite()
            MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE -> onRejectIncomingCallInvite()
        }
    }

    private fun sendIncomingCallInvite(to: String, from: String) {
        messageChannel.send(IncomingCallInvite(to = to, from = from))
    }

    /**
     * Responds to the client's decision to answer an incoming call invite.
     */
    private fun onAcceptIncomingCallInvite() {
        Log.i(TAG, "onAcceptIncomingCallInvite()")
        activity.answerCallInvite()
    }

    private fun onRejectIncomingCallInvite() {
        Log.i(TAG, "onRejectIncomingCallInvite")
        activity.rejectCallInvite()
    }

    companion object {
        const val TAG = "ClientMessageListener"
    }
}