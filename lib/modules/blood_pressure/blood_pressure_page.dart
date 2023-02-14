import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_table.dart';

class BloodPressurePage extends StatefulWidget {
  BloodPressurePage({Key? key}) : super(key: key);

  @override
  State<BloodPressurePage> createState() => _BloodPressurePageState();
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text("Huyết Áp"),
        ),
        body: BloodPressureTable());
  }
}
