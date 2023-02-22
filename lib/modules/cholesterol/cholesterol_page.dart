import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/cholesterol/cholesterol_table.dart';

class CholesterolPage extends StatefulWidget {
  CholesterolPage({Key? key}) : super(key: key);

  @override
  State<CholesterolPage> createState() => _CholesterolPageState();
}

class _CholesterolPageState extends State<CholesterolPage> {
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
          title: const Text("Cholesterol"),
        ),
        body: CholesterolTable());
  }
}
