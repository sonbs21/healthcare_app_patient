import 'package:get/get.dart';
import 'package:healthcare_mobile/models/notifications/notification_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class NotificationController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<DataNotificationResponse> listNotification =
      RxList<DataNotificationResponse>([]);
  var socketService = Get.find<SocketService>();

  @override
  void onInit() {
    super.onInit();

    socketService.socket.onConnect((data) {
      socketService.socket.on('newNotification', (msg) {
        try {
          DataNotificationResponse messageResponse =
              DataNotificationResponse.fromJson(msg['data']);
          initListNotification();
        } catch (e) {}
      });
    });
    initListNotification();
  }

  void initListNotification() async {
    final response = await appointmentRepository.getNotification(1, 20);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      listNotification.clear();
      listNotification.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
