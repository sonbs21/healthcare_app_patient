library custom_form_field;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/custom_form_field.dart';
import 'package:healthcare_mobile/modules/health-record/health_record_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/utils/auth_button.dart';

class HealthRecordPage extends StatelessWidget {
  // GlobalKey<FormState> key = GlobalKey<FormState>();
  CustomFormField customFormField = CustomFormField();
  final healthRecordController = Get.find<HealthRecordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [const BackButton(), const Text('Thông tin sức khỏe')],
          ),
        ),
        body: Scrollbar(
          child: Form(
          key: healthRecordController.formKey,
              // key: key,
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  _buildTextField(
                      "Chiều cao", healthRecordController.heightController),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _buildTextField(
                      "Cân nặng", healthRecordController.weightController),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Huyết áp"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField(
                      "Tâm thu", healthRecordController.systolicController),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _buildTextField(
                      "Tâm trương", healthRecordController.diastolicController),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Glucose"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField(
                      "Glucose", healthRecordController.glucoseController),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Cholesterol"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Cholesterol",
                      healthRecordController.cholesterolController),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Nhịp tim"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Nhịp tim",
                      healthRecordController.heartRateIndicatorController),
                  const SizedBox(
                    height: 16.0,
                  ),
                  _buildAddInfoButton(),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Get.offNamed(AppRoutes.HOME_PAGE);
                  //   },
                  //   child: Text('Thêm thông tin'),
                  // ),
                ],
              ),
            ),
          )),
        ));
  }

  Obx _buildAddInfoButton() {
    return Obx(
      () => AuthButton(
        widget: healthRecordController.isButtonLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                "Thêm thông tin".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        onClick: () {
          // Get.offNamed(AppRoutes.MAIN_NAVIGATION);
          String height = healthRecordController.heightController.text;
          String weight = healthRecordController.weightController.text;
          String systolic = healthRecordController.systolicController.text;
          String diastolic = healthRecordController.diastolicController.text;
          String heartRateIndicator =
              healthRecordController.heartRateIndicatorController.text;
          String cholesterol =
              healthRecordController.cholesterolController.text;
          String glucose = healthRecordController.glucoseController.text;
          healthRecordController.postHealthRecord(height, weight, systolic,
              diastolic, heartRateIndicator, cholesterol, glucose);
        },
      ),
    );
  }

  _buildTextField(String labelText, TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.number,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          labelText: labelText,
          // prefixIcon: const Icon(Icons.email_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
