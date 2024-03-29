import 'package:healthcare_mobile/utils/share_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  static late final SharedPreferences instance;
  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static String getAccessToken() {
    return instance.getString(SharePrefConstant.ACCESS_TOKEN) ?? "";
  }

  static void setAccessToken(String value) async {
    instance.setString(SharePrefConstant.ACCESS_TOKEN, value);
  }

  static String getRefreshToken() {
    return instance.getString(SharePrefConstant.REFRESH_TOKEN) ?? "";
  }

  static void setRefreshToken(String value) async {
    instance.setString(SharePrefConstant.REFRESH_TOKEN, value);
  }

  static String getPhone() {
    return instance.getString(SharePrefConstant.PHONE) ?? "";
  }

  static void setPhone(String value) async {
    instance.setString(SharePrefConstant.PHONE, value);
  }

  static String getPassword() {
    return instance.getString(SharePrefConstant.PASSWORD) ?? "";
  }

  static void setPassword(String value) async {
    instance.setString(SharePrefConstant.PASSWORD, value);
  }

  static String getId() {
    return instance.getString(SharePrefConstant.ID) ?? "";
  }

  static void setId(String value) async {
    instance.setString(SharePrefConstant.ID, value);
  }

  static String getConversationId() {
    return instance.getString(SharePrefConstant.CONVERSATIONID) ?? "";
  }

  static void setConversationId(String value) async {
    instance.setString(SharePrefConstant.CONVERSATIONID, value);
  }

  static String getConversationCallId() {
    return instance.getString(SharePrefConstant.CONVERSATION_CALL_ID) ?? "";
  }

  static void setConversationCallId(String value) async {
    instance.setString(SharePrefConstant.CONVERSATION_CALL_ID, value);
  }

  static String getCallerId() {
    return instance.getString(SharePrefConstant.CALLER_ID) ?? "";
  }

  static void setCallerId(String value) async {
    instance.setString(SharePrefConstant.CALLER_ID, value);
  }

  static String getCalleeId() {
    return instance.getString(SharePrefConstant.CALLEE_ID) ?? "";
  }

  static void setCalleeId(String value) async {
    instance.setString(SharePrefConstant.CALLEE_ID, value);
  }

  static String getCallName() {
    return instance.getString(SharePrefConstant.CALL_NAME) ?? "";
  }

  static void setCallName(String value) async {
    instance.setString(SharePrefConstant.CALL_NAME, value);
  }
}
