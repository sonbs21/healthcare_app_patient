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
}
