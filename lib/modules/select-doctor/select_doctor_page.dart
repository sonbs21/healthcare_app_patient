import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/modules/select-doctor/select_doctor_controller.dart';
import 'package:healthcare_mobile/modules/select-doctor/widget/doctor_item.dart';

class SelectDoctorPage extends StatelessWidget {
  final selectDoctorController = Get.find<SelectDoctorController>();
  @override
  Widget build(BuildContext context) {
    selectDoctorController.initListDoctor();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: getDoctorList())),
      ),
    );
  }

  getDoctorList() {
    return Obx(() => Column(
        children: List.generate(selectDoctorController.listDoctor.length,
            (index) => DoctorItem(selectDoctorController.listDoctor[index]))));
  }
}
