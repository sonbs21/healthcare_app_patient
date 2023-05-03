import 'package:get/get.dart';
import 'package:healthcare_mobile/models/register/select_doctor_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';

class SelectDoctorController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  DataDoctorResponse? doctor;

  RxList<DataDoctorLstResponse> listDoctor = RxList<DataDoctorLstResponse>([]);
  void initListDoctor() async {
    final response = await userRepository.getDoctors(1, 10);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listDoctor.clear();
      listDoctor.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void selectDoctor(String doctorId) async {
    final response = await userRepository
        .selectDoctor(SelectDoctorRequest(doctorId: doctorId))
        .then((value) => Get.offAllNamed(AppRoutes.MAIN_NAVIGATION));
    // if (response.statusCode == 200) {
    //   // listBmi = response.data;
    //   listDoctor.clear();
    //   listDoctor.addAll(response.data);
    // } else {
    //   // Xử lý khi API trả về lỗi
    // }
  }
}
