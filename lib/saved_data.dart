import 'dart:html';

import 'package:appwrite/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  ///save user id locally
  static Future<void> savedUserId(String id) async {
    await preferences!.setString("userId", id);
  }

//get user id
  static String getUserId() {
    return preferences!.getString("userId") ?? "";
  }

// save user name
  static Future<void> savedUserName(String name) async {
    await preferences!.setString("name", name);
  }

  //get user name
  static String getUserName() {
    return preferences!.getString("name") ?? "";
  }

// save user email
  static Future<void> savedUserEmail(String email) async {
    await preferences!.setString("email", email);
  }

// get user email
  static String getUserEmail() {
    return preferences!.getString("email") ?? "";
  }
}
