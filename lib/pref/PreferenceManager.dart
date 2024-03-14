import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_mar14/pref/preferenceKeys.dart';

class PreferenceManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Store methods
  static Future<void> storeToken(String token) async {
    await _prefs?.setString(PreferenceKeys.tokenKey, token);
  }

  static Future<void> storeUserID(int userID) async {
    await _prefs?.setInt(PreferenceKeys.userIDKey, userID);
  }

  static Future<void> storeFirstName(String firstName) async {
    await _prefs?.setString(PreferenceKeys.firstNameKey, firstName);
  }

  static Future<void> storeLastName(String? lastName) async {
    await _prefs?.setString(PreferenceKeys.lastNameKey, lastName ?? '');
  }

  //role 1 -player
  // 2 - coach
  static Future<void> storeRole(int role) async {
    await _prefs?.setInt(PreferenceKeys.roleKey, role);
  }

  static Future<void> storeLoginStatus(bool isLoggedIn) async {
    await _prefs?.setBool(PreferenceKeys.isLoggedInKey, isLoggedIn);
  }

  static Future<void> videoPlayStatus(bool isPlay) async {
    await _prefs?.setBool(PreferenceKeys.isVideoPlay, isPlay);
  }

  // Get methods
  static String? getToken() {
    return _prefs?.getString(PreferenceKeys.tokenKey);
  }

  static int? getUserID() {
    return _prefs?.getInt(PreferenceKeys.userIDKey);
  }

  static String? getFirstName() {
    return _prefs?.getString(PreferenceKeys.firstNameKey);
  }

  static String? getLastName() {
    return _prefs?.getString(PreferenceKeys.lastNameKey);
  }

  static int? getRole() {
    return _prefs?.getInt(PreferenceKeys.roleKey);
  }

  static bool? isPlayer() {
    return _prefs?.getInt(PreferenceKeys.roleKey) == 1;
  }

  static bool? isCoach() {
    return _prefs?.getInt(PreferenceKeys.roleKey) == 2;
  }

  static bool? getLoginStatus() {
    return _prefs?.getBool(PreferenceKeys.isLoggedInKey);
  }

  static bool? getVideoPlayStatus() {
    return _prefs?.getBool(PreferenceKeys.isVideoPlay);
  }
  // Add other methods for saving/retrieving preferences as needed
  //clear
  static Future<void> clearPreferences() async {
    await _prefs?.clear();
  }
  static Future<void> clearUserPreferences() async {
    await _prefs?.setBool(PreferenceKeys.isLoggedInKey, false);
  }

  // Add other methods for saving/retrieving preferences as needed
}
