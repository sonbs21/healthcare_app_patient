import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class DoctorController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  final userRepository = Get.find<UserRepository>();
  RxList<DataResponse> listAppointment = RxList<DataResponse>([]);
  late DataDoctorResponse doctor;
  late PatientResponse? patient;
  var formKey = GlobalKey<FormState>();
  var isButtonLoading = false.obs;

  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var notesController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    initListAppointment();
  }

  void initListAppointment() async {
    final response = await appointmentRepository.getAppointmentPatient();
    final response2 = await userRepository.getMe();
    String? doctorId = '';
    if (response2.statusCode == 200) {
      doctorId = response2.data?.patient?.doctorId;
      patient = response2.data?.patient!;
    }
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listAppointment.addAll(response.data);
      print(listAppointment[0].doctor);
    } else {
      // Xử lý khi API trả về lỗi
    }

    final response3 = await userRepository.getDoctorById(doctorId!);
    if (response3.statusCode == 200) {
      doctor = response3.data!;
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
          // Get.offAllNamed(AppRoutes.MAIN_NAVIGATION);
        });
      } on DioError catch (e) {
        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }
}
