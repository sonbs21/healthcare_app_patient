import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Text('Doctor Page')),
    );
  }
}
