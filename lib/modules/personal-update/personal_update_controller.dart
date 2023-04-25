import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_request.dart';
import 'package:healthcare_mobile/modules/personal/personal_controller.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';

class PersonalUpdateController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  final personalController = Get.find<PersonalController>();

  // var formKey = GlobalKey<FormState>();
  void updatePersonal(
      String fullName,
      String address,
      String gender,
      DateTime dateOfBirth,
      String job,
      String nameCarer,
      String phoneCarer) async {
    // if (formKey.currentState!.validate()) {
    try {
      final response = await userRepository.update(UserRequest(
          fullName: fullName,
          address: address,
          gender: gender,
          dateOfBirth: dateOfBirth,
          job: job,
          fullNameCarer: nameCarer,
          phoneCarer: phoneCarer));

      print("response___${response.statusCode}");
      if (response.statusCode == 200) {
        final response = await userRepository
            .getMe()
            .then((value) => personalController.getInforPersonal())
            .then((value) => Get.offNamed(AppRoutes.PERSONAL_INFO_PAGE));
      }
      //     .then((value) {
      //   print("object__${value.data!.patient?.fullName}");
      //   personalController.getInforPersonal();
      // }).then((value) => Get.back());
    } on DioError catch (e) {
      print("response___${e}");
    }
    // }
  }
}
