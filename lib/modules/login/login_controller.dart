import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var formKeyDialog = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailResetPasswordController = TextEditingController();
  var isError = '';
  var isObscurePassword = true.obs;
  var isButtonLoading = false.obs;
  var isButtonLoadingDialog = false.obs;

  final userRepository = Get.find<UserRepository>();

  void login(String phone, String password) async {
    // final client = RestClient(dio);
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;

      try {
        await userRepository
            .loginUser(LoginRequest(phone: phone, password: password))
            .then((value) {
          if (value.data?.role == "PATIENT") {
            LocalStorageService.setAccessToken(
                value.data?.access_token as String);
            LocalStorageService.setRefreshToken(
                value.data?.refresh_token as String);
            LocalStorageService.setId(value.data?.memberId as String);

            LocalStorageService.setPhone(phone);
            LocalStorageService.setPassword(password);

            Get.offAllNamed(AppRoutes.MAIN_NAVIGATION);
          } else {
            EasyLoading.showError("Số điện thoại không phù hợp");
          }
        });
      } on DioError catch (e) {
        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }

  void resetPassword(String email) {
    // if (formKeyDialog.currentState!.validate()) {
    //   isButtonLoadingDialog.value = true;

    //   authService.resetPassword(email);

    //   Timer(const Duration(seconds: 2), () {
    //     isButtonLoadingDialog.value = false;
    //   });

    //   emailResetPasswordController.clear();

    //   Get.back();
    // }
  }
}
