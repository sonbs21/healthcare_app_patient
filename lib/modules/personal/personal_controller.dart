import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();
// String? fullname = personalController.user?.fullName!;
  var fullNameController = TextEditingController();
  RxString fullName = "".obs;
  var addressController = TextEditingController();
  String address = "";
  String avatar = "";
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
  Position? currentPosition;

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

  void emergency() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userRepository.emergency("${position.latitude}", "${position.longitude}");

    final phoneNumber = 'tel:115';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Không thể gọi đến số điện thoại $phoneNumber';
    }
  }

  void getInforPersonal() async {
    final response = await userRepository.getMe();
    if (response.statusCode == 200) {
      user = response.data!.patient!;
      print("user?.avatar:${user?.avatar}");
      avatar = user?.avatar ??
          "https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg";
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
