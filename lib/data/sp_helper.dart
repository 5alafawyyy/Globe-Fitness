import 'dart:convert';

import 'package:pluralsight_course_1/data/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
// Static instance of Shared Prefrences
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Store the Session object to the SharedPrefrences.
  /// But we can not save objects, so we convert it into String
  /// Map to String using [json.ecode] : to transform this object into a Map.
  Future writeSession(Session session) async {
    prefs.setString(
      session.id.toString(),
      jsonEncode(
        session.toJson(),
      ),
    );
  }

  // To retreive all the sessions in the Shared Prefrences to user
  List<Session> getSessions() {
    List<Session> sessions = [];

    // To get all Keys from Shared Prefrences
    /// the main differnet between Set and List: the Set is Un-Ordered list,
    /// but List is Ordered
    /// in Shared Prefrences all data is Un Ordered
    Set<String> keys = prefs.getKeys();
    for (var key in keys) {
      if (key != 'counter') {
        Session session = Session.fromJson(
          json.decode(prefs.getString(key) ?? ''),
        );
        sessions.add(session);
      }
    }
    return sessions;
  }

  // To solve the problem of the ID by setting the counter with new index
  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  // To get the current  ID
  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  // Delete Session
  Future deleteSession(int id) async {
    await prefs.remove(id.toString());
  }
}
