import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class PersonalController extends GetxController {
  var listBmi = <UserResponse>[].obs;
  var userResponse = PatientResponse(
    id: "uid",
    fullName: "email",
    gender: "first_name",
    address: "last_name",
    avatar: "ffffff",
    job: "",
    phone: "",
    insuranceNumber: "",
    state: "",
    medicalHistory: "",
    doctorId: "",
    // dateOfBirth: "",
  );

  final userRepository = Get.find<UserRepository>();
  @override
  void onInit() {
    // listLabelColor.value = Common.getListLabelColor();
    init();
    // loadBoard();
    // initListMember();
    // initBoardHistorical();
    super.onInit();
  }

  void init() async {
    await userRepository.getMe().then(
      (value) {
        userResponse = value.data?.patient as PatientResponse;
      },
    );
  }
}
