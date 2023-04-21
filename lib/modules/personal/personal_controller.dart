import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();

  PatientResponse? user;
  @override
  void onInit() {
    getInforPersonal();
    super.onInit();
  }

  void logout() async {
    // final client = RestClient(dio);

    // try {
    //   await userRepository.logout().then((value) {
    LocalStorageService.setAccessToken("");

    Get.offAllNamed(AppRoutes.LOGIN);
    //   });
    // } on DioError catch (e) {
    //   EasyLoading.showError(e.response?.data['message']);
    // }
  }

  void getInforPersonal() async {
    final response = await userRepository.getMe();
    if (response.statusCode == 200) {
      user = response.data!.patient!;
    }
  }
}
