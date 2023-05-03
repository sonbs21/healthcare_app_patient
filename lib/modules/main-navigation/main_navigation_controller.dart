import 'package:get/get.dart';
import 'package:healthcare_mobile/models/chats/call_response.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MainNavigationController extends GetxController {
  var tabIndex = 0;
  var socketService = Get.find<SocketService>();

  @override
  void onInit() {
    super.onInit();
    socketService.socket.onConnect((data) {
      socketService.socket.on('incomingCall', (msg) {
        // MessageResponse msga = msg;
        CallVideoResponse tmp = CallVideoResponse.fromJson(msg);
        LocalStorageService.setConversationCallId(tmp.conversationId as String);
        LocalStorageService.setCallerId(tmp.callerId as String);
        Get.toNamed(AppRoutes.CALL_PAGE, arguments: true);
      });

      socketService.socket.on('callAccepted', (msg) {
        Get.offNamed(AppRoutes.CALL_VIDEO_PAGE);
      });

      socketService.socket.on('callRejected', (msg) {
        Get.back();
      });

      socketService.socket.on('callCancelled', (msg) {
        // MessageResponse msga = msg;
        Get.back();
      });
    });
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
