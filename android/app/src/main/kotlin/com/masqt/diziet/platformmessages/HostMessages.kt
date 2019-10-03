package com.masqt.diziet.platformmessages

import com.masqt.diziet.Constants.MESSAGE_HOST_INCOMING_CALL_INVITE
import org.json.JSONObject

open class HostMessage() : JSONObject()

class IncomingCallInvite(from: String, to: String) : HostMessage() {
    init {
        put("type", MESSAGE_HOST_INCOMING_CALL_INVITE)
        put("payload", JSONObject().also {
            it.put("from", from)
            it.put("to", to)
        })
    }
}