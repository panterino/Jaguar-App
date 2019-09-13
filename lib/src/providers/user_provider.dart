import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyA7mKglYRQWJzDQ7437s_H3ZRLdukrlmaY';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));
    Map<String, dynamic> decodedResponse = json.decode(resp.body);
    print(decodedResponse);
    if (decodedResponse.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodedResponse['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));
    Map<String, dynamic> decodedResponse = json.decode(resp.body);
    print(decodedResponse);

    if (decodedResponse.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResponse['idToken']};
    } else {
      return {'ok': false, 'message': decodedResponse['error']['message']};
    }
  }
}
