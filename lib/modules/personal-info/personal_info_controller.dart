import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class PersonalInfoController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  PatientResponse? user;
  @override
  void onInit() {
    getInforPersonal();
    super.onInit();
  }

  void getInforPersonal() async {
    final response = await userRepository.getMe();
    if (response.statusCode == 200) {
      user = response.data!.patient!;
    }
  }
}
