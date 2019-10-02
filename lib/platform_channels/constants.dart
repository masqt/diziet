const String CHANNEL_NAME_TELEPHONY = 'com.masqt.diziet/telephony';

/* Host->client messages */
const String MESSAGE_HOST_CONNECTION_FAILURE = 'MESSAGE_HOST_CONNECTION_FAILURE';
const String MESSAGE_HOST_INCOMING_SMS = 'MESSAGE_HOST_INCOMING_SMS';
const String MESSAGE_HOST_INCOMING_CALL_INVITE =
    'MESSAGE_HOST_INCOMING_CALL_INVITE';
const String MESSAGE_HOST_INCOMING_CALL_INVITE_CANCELLED =
  'MESSAGE_HOST_INCOMING_CALL_INVITE_CANCELLED';

/* Client->host messages */
const String MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE =
  'MESSAGE_CLIENT_ACCEPT_INCOMING_CALL_INVITE';
const String MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE =
  'MESSAGE_CLIENT_REJECT_INCOMING_CALL_INVITE';
