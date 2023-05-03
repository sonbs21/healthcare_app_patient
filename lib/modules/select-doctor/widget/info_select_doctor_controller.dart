import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class InfoSelectDoctorController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  DataDoctorLstResponse? doctor;
  @override
  void onInit() {
    super.onInit();

    doctor = Get.arguments; // nhận tham số user
    // getDoctor(doctor?.id ?? "");
  }

  // void getDoctor(String doctorId) async {
  //   final response = await userRepository.getDoctorById(doctorId);
  //   if (response.statusCode == 200) {
  //     doctor = response.data!;
  //   }
  // }
}
