import 'package:diziet/util/diziet_preferences.dart'
    show setVulgarianToken, setFirebaseToken, setTwilioToken;
import 'package:diziet/util/endpoints.dart';

/// Log the user in to Vulgarian and store their access token.
Future<void> login(String username, String password) async {
  // Contact Vulgarian and exchange a username+password for an auth token
  final vulgarianToken = await retrieveVulgarianToken(username, password);
  // Store the auth token in shared preferences
  await setVulgarianToken(vulgarianToken);

  // Contact Vulgarian and exchange an auth token for another auth token,
  // this time the token that allows us to sync messages
  final firebaseToken = await retrieveFirebaseToken(vulgarianToken);
  // Store the token
  await setFirebaseToken(firebaseToken);

  // Contact Vulgarian and exchange an auth token for another auth token,
  // this time the token that allows us to register for incoming call
  // invites
  final twilioToken = await retrieveTwilioToken(vulgarianToken);
  // Store the token
  await setTwilioToken(twilioToken);
}

/// Retrieve the main authentication token from Vulgarian.
Future<String> retrieveVulgarianToken(String username, String password) async {
  // Get the login URL
  // final loginUrl = (await Endpoints.instance).loginUrl;
  throw UnimplementedError(); // TODO
}

/// Retrieve the message-syncing Firebase token from Vulgarian.
Future<String> retrieveFirebaseToken(String vulgarianToken) async {
  throw UnimplementedError();
}

/// Retrieve the incoming-call-invite Firebase token from Vulgarian.
Future<String> retrieveTwilioToken(String vulgarianToken) async {
  throw UnimplementedError();
}

/// Log the user out completely on their device. This removes
/// all authentication tokens and other personal data from shared preferences.
Future<void> logout() async {
  throw UnimplementedError();
}
