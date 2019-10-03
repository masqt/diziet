import 'package:diziet/platform_channels/constants.dart';

/// An abstract class from which client->host messages inherit.
/// It doesn't need to be deserializable from JSON, because we
/// never deal with client->host message JSON on the client.
abstract class TelephonyChannelClientMessage {
  Map<String, dynamic> toJson() => {'type': type, 'payload': payload};

  Map<String, dynamic> get payload;

  String get type;
}

class RegisterForCallInvites extends TelephonyChannelClientMessage {
  final String twilioToken;

  RegisterForCallInvites(this.twilioToken);

  get type => MESSAGE_CLIENT_REGISTER_FOR_CALL_INVITES;
  get payload => {"twilioToken": twilioToken};
}
