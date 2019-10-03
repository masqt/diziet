import 'package:diziet/platform_channels/constants.dart';
import 'package:diziet/platform_channels/host_messages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TelephonyChannelMessage', () {
    group('#fromJson', () {
      test('Handles inbound SMS messages', () {
        final _from = '+35311231234';
        final _to = '+35315559999';
        final _body = 'Hello world!';
        final _timestamp = 1569950696;
        Map<String, dynamic> obj = {
          'type': MESSAGE_HOST_INCOMING_SMS,
          'payload': {
            'from': _from,
            'to': _to,
            'body': _body,
            'timestamp': _timestamp,
          },
        };

        final message = TelephonyChannelHostMessage.fromJson(obj);
        expect(message.type, equals(MESSAGE_HOST_INCOMING_SMS));
        expect(message.payload['from'], equals(_from));
      });
    });
  });
}