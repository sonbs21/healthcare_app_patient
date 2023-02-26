import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/widgets/appointment_item.dart';
import 'package:healthcare_mobile/widgets/my_button.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

var doctorController = Get.find<DoctorController>();

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    getAppointmentList()
                  ]))),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40, right: 10),
        child: MyButton(
            disableButton: false,
            bgColor: Color(0xFF5856d6),
            title: "Đặt lịch hẹn",
            onTap: () {}),
      ),
    );
  }

  getAppointmentList() {
    return Column(
        children: List.generate(
            doctorController.listAppointment.length,
            (index) =>
                AppointmentItem(doctorController.listAppointment[index])));
  }
}
