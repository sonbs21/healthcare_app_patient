import 'package:flutter/material.dart';
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
  RxList<DataNotificationResponse> listNotificationNotRead =
      RxList<DataNotificationResponse>([]);
  RxBool isNoti = false.obs;
  RxString content = "".obs;
  RxString url = "".obs;
  RxInt page = 1.obs;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);

    socketService.socket.onConnect((data) {
      socketService.socket.on('newNotification', (msg) {
        try {
          DataNotificationResponse messageResponse =
              DataNotificationResponse.fromJson(msg['data']);
          listNotification.insert(0, messageResponse);

          listNotificationNotRead.add(messageResponse);
        } catch (e) {}
      });
    });
    initListNotification(page.value);
  }

  void readAll() {
    appointmentRepository
        .readAllNotification()
        .then((value) => listNotificationNotRead.clear());
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      initListNotification(page.value++);
    }
  }

  void initListNotification(int page) async {
    final response = await appointmentRepository.getNotification(page);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      if (page > 1) {
        listNotification.addAll(response.data);
      } else {
        listNotification.clear();
        listNotification.addAll(response.data);
      }
    } else {
      // Xử lý khi API trả về lỗi
    }

    for (var i = 0; i < listNotification.length; i++) {
      if (listNotification[i].isRead == false) {
        listNotificationNotRead.add(listNotification[i]);
      }
    }
  }
}
