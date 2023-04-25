import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:intl/intl.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();
// String? fullname = personalController.user?.fullName!;
  var fullNameController = TextEditingController();
  RxString fullName = "".obs;
  var addressController = TextEditingController();
  String address = "";
  var jobController = TextEditingController();
  String job = "";
  var nameCarerController = TextEditingController();
  String nameCarer = "";
  var phoneCarerController = TextEditingController();
  String phoneCarer = "";
  // var medicalHistoryController = TextEditingController();
  var dateController = TextEditingController();
  // String medicalHistory = "";
  String gender = "";
  DateTime? time;

  var isCancelFullName = true.obs;
  var isCancelAddress = true.obs;
  var isCancelJob = true.obs;
  var isCancelInsuranceNumber = true.obs;
  var isCancelNameCarer = true.obs;
  var isCancelPhoneCarer = true.obs;
  var isLoadingButton = false.obs;

  PatientResponse? user;

  @override
  void onInit() {
    getInforPersonal();
    super.onInit();
  }

  void logout() async {
    LocalStorageService.setAccessToken("");

    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void getInforPersonal() async {
    final response = await userRepository.getMe();
    if (response.statusCode == 200) {
      user = response.data!.patient!;
      print("object___${user?.fullName}");

      fullNameController.text = user?.fullName! ?? "";
      fullName.value = user?.fullName! ?? "";
      addressController.text = user?.address! ?? "";
      address = user?.address! ?? "";
      jobController.text = user?.job! ?? "";
      job = user?.job! ?? "";
      nameCarerController.text = user?.carer[0].fullName ?? "";
      nameCarer = user?.carer[0].fullName ?? "";
      phoneCarerController.text = user?.carer[0].phone ?? "";
      phoneCarer = user?.carer[0].phone ?? "";
      // medicalHistoryController.text = user?.medicalHistory! ?? "";
      // medicalHistory = user?.fullName! ?? "";
      gender = user?.gender! ?? "";
      time = user?.dateOfBirth!;
      var inputFormat = DateFormat('dd/MM/yyyy').format(time!);
      dateController.text = inputFormat;
    }
  }
}
