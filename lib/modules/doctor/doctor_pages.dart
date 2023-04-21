import 'package:flutter/material.dart';
import 'package:healthcare_mobile/modules/doctor/appointment_pages.dart';
import 'package:healthcare_mobile/modules/doctor/info_doctor_pages.dart';
import 'package:healthcare_mobile/modules/doctor/map_pages.dart';
import 'package:healthcare_mobile/widgets/tabbar_widget.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Bác sĩ',
        tabs: const [
          Tab(icon: Icon(Icons.calendar_month), text: 'Lịch hẹn'),
          Tab(icon: Icon(Icons.person_3), text: 'Thông tin bác sĩ'),
          Tab(icon: Icon(Icons.map), text: 'Bản đồ'),
        ],
        children: [
          AppointmentPage(),
          InfoDoctorPage(),
          MapPage()
          // MapSample(),
        ],
      );
}
