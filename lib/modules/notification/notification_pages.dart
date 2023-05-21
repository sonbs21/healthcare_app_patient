import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/notifications/notification_response.dart';
import 'package:healthcare_mobile/modules/notification/notification_controller.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  var notificationController = Get.find<NotificationController>();
  // List<dynamic> notifications = [];

  @override
  Widget build(BuildContext context) {
    notificationController.readAll();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Thông báo",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: notificationController.listNotification.length,
            itemBuilder: (context, index) {
              return Slidable(
                // actionPane: SlidableDrawerActionPane(),
                // actionExtentRatio: 0.25,
                child: notificationItem(
                    notificationController.listNotification[index]),
              );
            }));
  }

  notificationItem(DataNotificationResponse notification) {
    DateTime? date = notification.createdAt;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    Color? colorStatus = Colors.white;
    switch (notification.typeNotification) {
      case 'WARNING':
        colorStatus = Colors.yellow[600];
        break;
      case 'REMIND':
        colorStatus = Colors.green[600];
        break;
      case 'EMERGENCY':
        colorStatus = Colors.red[600];
        break;
      case 'SYSTEM':
        colorStatus = Colors.grey[600];
        break;
      case 'APPOINTMENT':
        colorStatus = Colors.blue[400];
        break;
      default:
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: colorStatus,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: Icon(
                Icons.notifications,
                size: 25,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notification.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // in đậm văn bản
                        fontSize: 18.0, // phóng to văn bản
                      ),
                      textAlign: TextAlign.center, // canh giữa văn bản
                      overflow: TextOverflow
                          .ellipsis, // hiển thị ... khi văn bản vượt quá phạm vi
                      maxLines: 2, // giới hạn số dòng của văn bản
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      notification.content ?? '',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment:
                          Alignment.bottomRight, // hoặc Alignment.bottomRight
                      child: Text(
                        inputFormat,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          notification.typeNotification == "EMERGENCY"
              ? GestureDetector(
                  onTap: () {}, child: Text(notification.url ?? ""))
              : const SizedBox()
          // notification.postImage != '' ?
          //   Container(
          //     width: 50,
          //     height: 50,
          //     child: ClipRRect(
          //       child: Image.network(notification.postImage)
          //     ),
          //   )
          // : Container(
          //     height: 35,
          //     width: 110,
          //     decoration: BoxDecoration(
          //       color: Colors.blue[700],
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     child: Center(
          //       child: Text('Follow', style: TextStyle(color: Colors.white))
          //     )
          //   ),
        ],
      ),
    );
  }
}
