import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:dio/dio.dart';

class ChangePasswordController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var formKeyDialog = GlobalKey<FormState>();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isError = '';
  var isObscureOldPassword = true.obs;
  var isObscureNewPassword = true.obs;
  var isObscureConfirmPassword = true.obs;
  var isButtonLoading = false.obs;
  var isButtonLoadingDialog = false.obs;

}
