import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getSpotifyAccessToken() async {
  final String clientId = 'f9d72d0928954f909021f144cfbc5128';
  final String clientSecret = 'ea6ae4661f984d2b91d065a3bff00634';
  final String credentials = '$clientId:$clientSecret';
  final String encodedCredentials = base64.encode(utf8.encode(credentials));

  final String authUrl = 'https://accounts.spotify.com/api/token';
  final String body = 'grant_type=client_credentials';

  final http.Response response = await http.post(
    Uri.parse(authUrl),
    headers: {
      'Authorization': 'Basic $encodedCredentials',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: body,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['access_token'];
  } else {
    throw Exception('Failed to get access token');
  }
}
