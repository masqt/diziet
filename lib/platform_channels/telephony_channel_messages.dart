import 'package:diziet/platform_channels/constants.dart';

abstract class TelephonyChannelMessage {
  Map<String, dynamic> toJson() => {'type': type, 'payload': payload};

  Map<String, dynamic> get payload;

  String get type;

  static TelephonyChannelMessage fromJson(dynamic msg) {
    // Cast to a map
    final map = msg as Map<String, dynamic>;
    final String type = map['type'];
    final Map<String, dynamic> payload = map['payload'];

    switch (type) {
      case MESSAGE_TYPE_CONNECTION_FAILURE:
        return ConnectionFailure(payload);
      case MESSAGE_TYPE_INCOMING_SMS:
        return IncomingSms(payload);
      case MESSAGE_TYPE_INCOMING_CALL_INVITE:
        return IncomingCallInvite(payload);
      case MESSAGE_TYPE_INCOMING_CALL_INVITE_CANCELLED:
        return IncomingCallInviteCancelled();
      default:
        return null;
    }
  }
}

/// A message from the host letting us know that a call connection has failed.
/// This may have been an outgoing call, an incoming call invite, or an
/// active call, since Twilio's API throws the same error.
class ConnectionFailure extends TelephonyChannelMessage {
  final int _errorCode;
  final String _message;

  ConnectionFailure(Map<String, dynamic> payload)
      : _errorCode = payload['errorCode'],
        _message = payload['message'];

  get type => MESSAGE_TYPE_CONNECTION_FAILURE;

  get payload => {'errorCode': _errorCode, 'message': _message};
}

/// A message from the host that means we have just received a new (SMS) message.
class IncomingSms extends TelephonyChannelMessage {
  final String _from;
  final String _to;
  final String _body;
  final String _direction;
  final int _timestamp;

  IncomingSms(Map<String, dynamic> payload)
      : _from = payload['from'],
        _to = payload['to'],
        _body = payload['body'],
        _direction = payload['direction'],
        _timestamp = payload['timestamp'];

  String get type => MESSAGE_TYPE_INCOMING_SMS;

  Map<String, dynamic> get payload => <String, dynamic>{
        'from': _from,
        'to': _to,
        'body': _body,
        'direction': _direction,
        'timestamp': _timestamp,
      };
}

/// A message from the host alerting us that someone is trying to call us.
class IncomingCallInvite extends TelephonyChannelMessage {
  final String _callerNumber;
  final String _recipientNumber;

  IncomingCallInvite(Map<String, dynamic> payload)
      : _callerNumber = payload['callerNumber'],
        _recipientNumber = payload['recipientNumber'];

  get type => MESSAGE_TYPE_INCOMING_CALL_INVITE;

  get payload => {
        'from': _callerNumber,
        'to': _recipientNumber,
      };
}

/// A message from the host telling us that the active call invite
/// has been cancelled.
class IncomingCallInviteCancelled extends TelephonyChannelMessage {
  get type => MESSAGE_TYPE_INCOMING_CALL_INVITE_CANCELLED;

  get payload => {};
}
