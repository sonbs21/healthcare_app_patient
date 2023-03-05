import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/custom_form_field.dart';
import 'package:healthcare_mobile/modules/doctor/appointment_controller.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/modules/health-record/health_record_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/utils/auth_button.dart';
import 'package:intl/intl.dart';

class AppointmentForm extends StatefulWidget {
  AppointmentForm({Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

var doctorController = Get.find<DoctorController>();

class _AppointmentFormState extends State<AppointmentForm> {
  // GlobalKey<FormState> key = GlobalKey<FormState>();
  // TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String currentValue = '';
  String selectedItem = '';

  CustomFormField customFormField = CustomFormField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          title: Row(
            children: const [BackButton(), Text('Đặt lịch hẹn')],
          ),
        ),
        body: Scrollbar(
          child: Form(
              // key: key,
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildTextField(
                      "Họ và tên",
                      doctorController.patient?.fullName,
                      doctorController.fullNameController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildTextField("Số điện thoại", "3123",
                      doctorController.phoneController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: doctorController.dateController,
                    decoration: const InputDecoration(
                        labelText: 'Ngày hẹn',
                        hintText: 'Chọn ngày',
                        suffixIcon: Icon(Icons.calendar_today),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0)),
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Giờ hẹn:",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        currentValue,
                        style: TextStyle(fontSize: 18),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text('Chọn giờ hẹn'),
                            onPressed: () => showCustomDialog(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    maxLines: null,
                    controller: doctorController.notesController,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ghi chú',
                      hintText: 'Ghi chú',
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }

  Obx _buildAddInfoButton() {
    return Obx(
      () => AuthButton(
        widget: doctorController.isButtonLoading.isTrue
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
          String fullName = doctorController.fullNameController.text;
          String phone = doctorController.phoneController.text;
          String timeMeeting = doctorController.timeController.text;
          String notes = doctorController.notesController.text;
          // String dateMeeting = doctorController.dateController.;

          doctorController.postAppointment(
              fullName, phone, _selectedDate, notes, timeMeeting);
        },
      ),
    );
  }

  showCustomDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(16.0),
            title: Text('Chọn giờ hẹn'),
            content: SizedBox(
              width: 400, // set width of content
              height: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.sunny,
                          size: 18, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 18),
                      const Text("Buổi sáng")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _dialogSelect('8h-8h30'),
                      const SizedBox(width: 20),
                      _dialogSelect('8h40-9h10'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _dialogSelect('10h-10h30'),
                      const SizedBox(width: 20),
                      _dialogSelect('9h20-9h50'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _dialogSelect('10h40-11h10'),
                      const SizedBox(width: 20),
                      _dialogSelect('11h20-11h50'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.brightness_4,
                          size: 18, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 18),
                      const Text("Buổi chiều")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _dialogSelect('13h-13h30'),
                      const SizedBox(width: 20),
                      _dialogSelect('13h40-14h10'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _dialogSelect('14h20-14h50'),
                      const SizedBox(width: 20),
                      _dialogSelect('15h-15h30'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _dialogSelect('15h40-16h10'),
                      const SizedBox(width: 20),
                      _dialogSelect('16h20-16h50'),
                    ],
                  ),
                ],
              ),
            ));
      },
    );

    // Sau khi chọn xong giá trị, bạn có thể thực hiện các hành động tiếp theo
    // tại đây, chẳng hạn như cập nhật giá trị trên trang hiện tại.
    if (selectedItem != null) {
      setState(() {
        currentValue = selectedItem;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        doctorController.dateController.text =
            DateFormat.yMd().format(_selectedDate);
      });
    }
  }

  _buildTextField(String labelText, String? initialValue,
      TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller ?? TextEditingController(),
      initialValue: initialValue ?? '',
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.text,
      onSaved: (save) {
        if (initialValue != null) {
          controller.text = initialValue;
        } else {
          controller.text = save!;
        }
        // controller.text = save!;
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

  _dialogSelect(
    String labelText,
  ) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        child: Text(
          labelText,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          selectedItem = labelText;
          Navigator.pop(context);
        },
      ),
    );
  }
}
