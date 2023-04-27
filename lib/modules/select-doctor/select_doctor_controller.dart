import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class SelectDoctorController extends GetxController {
  final userRepository = Get.find<UserRepository>();

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
}
