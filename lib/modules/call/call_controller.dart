import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/person_response.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/service/socket_service.dart';

class CallController extends GetxController {
  Rx<bool> isReceiver = false.obs;
  var socketService = Get.find<SocketService>();
  RxString fullNameCaller = "".obs;
  RxString fullNameCallee = "".obs;
  final userRepository = Get.find<UserRepository>();

  @override
  void onInit() {
    initPerson();
    super.onInit();
    isReceiver.value = Get.arguments;
  }

  void initPerson() async {
    await userRepository.getPerson(LocalStorageService.getCallerId()).then(
        (value) => fullNameCaller.value = value.data?.doctor?.fullName! ?? "");

    fullNameCallee.value = LocalStorageService.getCallName();
  }

  void acceptVideo() async {
    socketService.socket.emit('acceptCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getCallerId(),
      "calleeId": LocalStorageService.getId()
    });
    Get.offNamed(AppRoutes.CALL_VIDEO_PAGE);
    // });
  }

  void refuseVideo() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('rejectCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getCallerId(),
      "calleeId": LocalStorageService.getId()
    });
    Get.back();
    // });
  }

  void cancelVideo() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('cancelCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getId(),
      "calleeId": LocalStorageService.getCalleeId()
    });
    Get.back();
    // });
  }

  void getPerson() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('cancelCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getId(),
      "calleeId": LocalStorageService.getCalleeId()
    });
    Get.back();
    // });
  }
}
