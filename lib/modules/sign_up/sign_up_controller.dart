import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/register/register_request.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/service/auth_service.dart';

class SignUpController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var medicalHistoryController = TextEditingController();
  var insuranceNumberController = TextEditingController();
  var jobController = TextEditingController();
  var stateController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneCarerController = TextEditingController();
  var nameCarerController = TextEditingController();
  var dateController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isObscurePassword = true.obs;
  var isObscureConfirmPassword = true.obs;
  var isLoadingButton = false.obs;

  var authService = Get.find<AuthService>();

  var userRepository = Get.find<UserRepository>();

  void signUp(
    String phone,
    password,
    fullName,
    gender,
    address,
    insuranceNumber,
    job,
    state,
    medicalHistory,
    phoneCarer,
    nameCarer,
    DateTime dateOfBirth,
  ) async {
    try {
      List<RegisterCarerRequest> carers = [];
      RegisterCarerRequest carer =
          RegisterCarerRequest(phone: phoneCarer, fullName: nameCarer);
      carers.add(carer);
      final user = await userRepository.register(RegisterRequest(
          phone: phone,
          carers: carers,
          address: address,
          job: job,
          password: password,
          gender: gender,
          fullName: fullName,
          insuranceNumber: insuranceNumber,
          state: state,
          medicalHistory: medicalHistory,
          dateOfBirth: dateOfBirth));
      if (user.statusCode == 200) {
        authService.signInWithPhoneNumber(phone, password);
      }
    } on DioError catch (e) {
      // if (e.response != null) {
      //   EasyLoading.showError(e.response?.data['message']);
      // }
    }
  }
}
