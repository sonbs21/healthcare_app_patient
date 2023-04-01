import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/widgets/appointment_item.dart';
import 'package:healthcare_mobile/widgets/my_button.dart';

class AppointmentPage extends StatelessWidget {
  var doctorController = Get.find<DoctorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => DropdownButton<String>(
                          value: doctorController.dropdownValue.value,
                          onChanged: (String? newValue) {
                            String status = "";
                            if (newValue != null) {
                              switch (newValue) {
                                case "Đang chờ":
                                  status = 'CREATED';
                                  break;
                                case 'Chấp thuận':
                                  status = 'APPROVED';
                                  break;
                                case "Từ chối":
                                  status = 'REFUSED';
                                  break;
                                case "Đã hủy":
                                  status = 'CANCELED';
                                  break;
                                case "Đã hoàn thành":
                                  status = 'COMPLETED';
                                  break;
                                default:
                                  status = "";
                                  break;
                              }
                              doctorController.changeDropdownValue(newValue);
                              doctorController.initNewAppointment(status);
                            }
                          },
                          items: <String>[
                            'Tất cả',
                            'Đang chờ',
                            'Chấp thuận',
                            'Từ chối',
                            'Đã hủy',
                            "Đã hoàn thành"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    const SizedBox(
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
            onTap: () {
              Get.toNamed(AppRoutes.APPOINMENT_PAGE);
            }),
      ),
    );
  }

  getAppointmentList() {
    return Obx(() => Column(
        children: List.generate(
            doctorController.listAppointment.length,
            (index) =>
                AppointmentItem(doctorController.listAppointment[index]))));
  }
}
