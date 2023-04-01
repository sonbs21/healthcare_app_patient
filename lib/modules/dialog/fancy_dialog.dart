library fancy_dialog;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:intl/intl.dart';

class FancyDialog extends StatelessWidget {
  FancyDialog({Key? key, this.data}) : super(key: key);
  final data;

  var doctorController = Get.find<DoctorController>();

  @override
  Widget build(BuildContext context) {
    DateTime? date = data?.dateMeeting;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    String appointmentStatus = '';
    Color? colorStatus = Colors.white;

    switch (data?.dateMeeting) {
      case 'CREATED':
        appointmentStatus = 'Đang chờ';
        colorStatus = Colors.yellow[600];
        break;
      case 'APPROVED':
        appointmentStatus = 'Chấp nhận';
        colorStatus = Colors.green[600];
        break;
      case 'REFUSED':
        appointmentStatus = 'Từ chối';
        colorStatus = Colors.red[600];
        break;
      case 'CANCELED':
        appointmentStatus = 'Đã hủy';
        colorStatus = Colors.grey[600];
        break;
      default:
        break;
    }
    // if (!defaultButtons!)
    //   assert(actionButtons != null,
    //       '\n***actionButtons cannot be null when defaultButtons is false***\n');
    // width = MediaQuery.of(context).size.width;
    // height = MediaQuery.of(context).size.height;
    // var dialogWidth = 0.36 * height!;

    // assert(MediaQuery.of(context) != null,
    //     '\n****context does not contain media query object***\n');
    // assert(title != null, '\n****title is required***\n');
    // assert(notes != null, '\n****description is required***\n');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          width: 500,
          height: 450,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // image,
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  "Thông tin cuộc hẹn",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 10, 25),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Họ tên: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              data?.fullName,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Số điện thoại: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              data?.phone,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Trạng thái: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Container(
                              height: 24,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorStatus,
                              ),
                              child: Text(
                                appointmentStatus,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Ngày hẹn: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              inputFormat,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Giờ hẹn: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              data?.timeMeeting,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Bác sĩ phụ trách: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              data?.doctor?.fullName,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Mô tả: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.start,
                          maxLines: 5,
                        ),
                        Text(
                          data?.notes,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              data?.statusAppointment != 'CANCELED'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // if (statusAppointment != 'CANCEL')
                        // theme == 0 && statusAppointment != 'CANCEL'
                        // ?
                        customButton(
                          "Hủy lịch hẹn",
                          Colors.grey,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        customButton("Đóng", Colors.pink)
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[customButton("Đóng", Colors.pink)],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(String t, Color c) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          primary: c,
        ),
        child: Text(
          t,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () {
          // f();
          if (t == "Đóng") {
            Get.back();
          } else {
            doctorController.cancelAppointment(data?.id);
            Get.back();
          }
        },
      ),
    );
  }
}
