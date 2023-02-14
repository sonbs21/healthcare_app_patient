library custom_form_field;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/custom_form_field.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/utils/auth_button.dart';

class HealthRecordPage extends StatelessWidget {
  // GlobalKey<FormState> key = GlobalKey<FormState>();
  CustomFormField customFormField = CustomFormField();

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
              // key: key,
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  _buildTextField("Chiều cao"),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _buildTextField("Cân nặng"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Huyết áp"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Tâm thu"),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _buildTextField("Tâm trương"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Glucose"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Glucose"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Cholesterol"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Cholesterol"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Nhịp tim"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _buildTextField("Nhịp tim"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AuthButton(
                    widget: Text(
                      "Thêm thông tin".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onClick: () {},
                  ),
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

  _buildTextField(String labelText) {
    return TextFormField(
      autofocus: false,
      // controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.number,
      // onSaved: (save) {
      //   controller.text = save!;
      // },
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
