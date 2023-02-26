import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_mobile/widgets/tabbar_widget.dart';
import 'package:healthcare_mobile/modules/doctor/info_doctor_pages.dart';
import 'package:healthcare_mobile/modules/doctor/appointment_pages.dart';
import 'package:healthcare_mobile/modules/doctor/map_pages.dart';

class DoctorPage extends StatefulWidget {
  DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
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
          Container(),
          // MyMap(),
        ],
      );
}
