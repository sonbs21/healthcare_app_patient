import 'package:get/get.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class DoctorController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  final userRepository = Get.find<UserRepository>();
  RxList<DataResponse> listAppointment = RxList<DataResponse>([]);
  late DataDoctorResponse doctor;

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
    }
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listAppointment.addAll(response.data);
      print(listAppointment);
    } else {
      // Xử lý khi API trả về lỗi
    }

    final response3 = await userRepository.getDoctorById(doctorId!);
    if (response3.statusCode == 200) {
      doctor = response3.data!;
    }
    print(doctor.fullName);
  }
}
