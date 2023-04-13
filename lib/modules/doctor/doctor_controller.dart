import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/rating/rating_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

class DoctorController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  final userRepository = Get.find<UserRepository>();
  RxList<DataResponse> listAppointment = RxList<DataResponse>([]);
  RxList<DataDoctorLstResponse> listDoctors = RxList<DataDoctorLstResponse>([]);
  late DataDoctorResponse doctor;
  late PatientResponse? patient;
  var formKey = GlobalKey<FormState>();
  var isButtonLoading = false.obs;
  var dropdownValue = 'Tất cả'.obs;
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var notesController = TextEditingController();
  String? doctorId = "";

  @override
  void onInit() {
    super.onInit();

    initListAppointment();

    if (doctorId == "") {
      getDoctors();
    }
  }

  void changeDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  void initListAppointment() async {
    final response2 = await userRepository.getMe();
    if (response2.statusCode == 200) {
      LocalStorageService.setId(response2.data?.patient?.id as String);
      doctorId = response2.data?.patient?.doctorId;
      if (doctorId == "") {
        return;
      }
      patient = response2.data?.patient!;
      fullNameController.text = patient?.fullName ?? '';
      phoneController.text = patient?.phone ?? '';
    }
    final response =
        await appointmentRepository.getAppointmentPatient(1, 10, null);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listAppointment.clear();
      listAppointment.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }

    final response3 = await userRepository.getDoctorById(doctorId!);
    if (response3.statusCode == 200) {
      doctor = response3.data!;
    }
  }

  void initNewAppointment(String? status) async {
    final response =
        await appointmentRepository.getAppointmentPatient(1, 10, status);
    if (response.statusCode == 200) {
      // listBmi = response.data;

      listAppointment.clear();
      listAppointment.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void getDoctors() async {
    final response = await userRepository.getDoctors(1, 10);
    if (response.statusCode == 200) {
      // listBmi = response.data;

      listDoctors.clear();
      listDoctors.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void postAppointment(String fullName, String phone, DateTime dateMeeting,
      String timeMeeting, String notes) async {
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;
      try {
        await appointmentRepository
            .postAppointment(AppointmentRequest(
          fullName: fullName,
          phone: phone,
          dateOfBirth: patient!.dateOfBirth,
          dateMeeting: dateMeeting,
          notes: notes,
          timeMeeting: timeMeeting,
        ))
            .then((value) {
          initListAppointment();
        });
      } on DioError catch (e) {
        isButtonLoading.value = false;

        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }

  void cancelAppointment(String id) async {
    try {
      await appointmentRepository.cancelAppointment(id).then((value) {});
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  void postRating(String _doctorId, String rating) async {
    try {
      await userRepository
          .postRating(RatingRequest(doctorId: _doctorId, rating: rating))
          .then((value) async {
        final response = await userRepository.getDoctorById(_doctorId);
      });
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }
}
