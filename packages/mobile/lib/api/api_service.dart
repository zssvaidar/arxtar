import 'dart:convert';

import '../models/models.dart';


class ApiService {

  Future<Session> getSessionData() async {
    final session = await _fetchUserSessin();

    final Map<String, dynamic> json = jsonDecode(session);

    // print(Session.fromJson(json).toString());
    return Session.fromJson(json);
  }

  Future<String> _fetchUserSessin() async {
    return """
      {
        "id": "004423",
        "durationInMinutes": 60,
        "dietType": "some",
        "calories": 45,
        "tags": ["tag1", "tag2"]
      }
    """;
  }
}