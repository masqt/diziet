import 'package:diziet/platform_channels/constants.dart';
import 'package:flutter/services.dart';

import 'client_messages.dart';
import 'host_messages.dart';

/// A wrapper for telephony-related messaging between Flutter and the
/// host's device-specific code. By telephony we mean message & call-related
/// updates, including notifications.
///
/// Messages (sent or received) must have a type (which must be a string
/// in `constants.dart`) and a payload (which can be anything serializable
/// to JSON).
///
/// Parts of the code that want to know when messages reach Flutter over
/// the channel must register themselves as listeners, which means they
/// must implement [TelephonyChannelListener].
class TelephonyChannel {
  // Create a singleton method channel for communicating with the host
  static const _channel = const BasicMessageChannel(
    CHANNEL_NAME_TELEPHONY,
    JSONMessageCodec(),
  );

  static TelephonyChannel instance = TelephonyChannel._();

  final Set<TelephonyChannelListener> _listeners =
      new Set<TelephonyChannelListener>();

  TelephonyChannel._() {
    _channel.setMessageHandler((msg) async {
      final message = TelephonyChannelHostMessage.fromJson(msg);
      if (message != null) {
        _publish(message);
      }
    });
  }

  static void addListener(TelephonyChannelListener listener) {
    instance._listeners.add(listener);
  }

  static void removeListener(TelephonyChannelListener listener) {
    instance._listeners.remove(listener);
  }

  /// Send a message object to the host.
  static void send(TelephonyChannelClientMessage message) {
    _channel.send(message.toJson());
  }

  void _publish(TelephonyChannelHostMessage message) {
    _listeners.forEach((l) => l.onTelephonyChannelMessage(message));
  }
}

/// An abstract class that objects must extend if they want to register
/// as listeners for messages coming from the host over the telephony
/// channel.
abstract class TelephonyChannelListener {
  void onTelephonyChannelMessage(TelephonyChannelHostMessage message);
}
