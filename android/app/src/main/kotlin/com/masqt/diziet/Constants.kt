package com.masqt.diziet

object Constants {
    const val CHANNEL_NAME_TELEPHONY = "com.masqt.diziet/telephony"

    /* Client -> host messages */
    const val MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE = "MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE"
    const val MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE = "MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE"

    /* Host -> client messages */
    const val MESSAGE_HOST_INCOMING_CALL_INVITE = "MESSAGE_HOST_INCOMING_CALL_INVITE"
}