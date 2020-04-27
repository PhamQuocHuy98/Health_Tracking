import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _singleton = UserPreferences._internal();

  factory UserPreferences() {
    return _singleton;
  }

  UserPreferences._internal();

  Future<String> getTokenUser() async {
    return (await SharedPreferences.getInstance())
            .getString(UserPreferenceKey.UserToken.toString()) ??
        '';
  }

  Future<bool> setTokenUser(String value) async {
    return (await SharedPreferences.getInstance())
            .setString(UserPreferenceKey.UserToken.toString(), value) ??
        false;
  }

  Future<String> getUser() async {
    return (await SharedPreferences.getInstance())
            .getString(UserPreferenceKey.User.toString()) ??
        '';
  }

  Future<bool> setUser(String value) async {
    return (await SharedPreferences.getInstance())
            .setString(UserPreferenceKey.User.toString(), value) ??
        false;
  }
  // Future<String> getWeight
}

enum UserPreferenceKey {
  UserToken,
  NotificationsEnabled,
  ClientUUID,
  FCMToken,
  User
}
