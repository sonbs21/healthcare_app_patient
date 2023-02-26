import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  void logout() async {
    // final client = RestClient(dio);

    // try {
    //   await userRepository.logout().then((value) {
    LocalStorageService.setAccessToken("");

    Get.offAllNamed(AppRoutes.LOGIN);
    //   });
    // } on DioError catch (e) {
    //   EasyLoading.showError(e.response?.data['message']);
    // }
  }
}
