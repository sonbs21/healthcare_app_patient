import 'package:get/get.dart';
import 'package:healthcare_mobile/models/chats/conversation_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/repository/chat.repository.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<String> listAppointment = RxList<String>([]);
  RxBool isDateSelected = false.obs;

  void getAppointmentTime(String? doctorId, String? timeDate) async {
    String dateString = '$timeDate 17:00:00';
    DateFormat format =
        DateFormat('M/d/y H:m:s'); // định dạng của chuỗi ngày tháng
    DateTime date = format.parse(dateString);
    final response =
        await appointmentRepository.getAppointmentTime(doctorId, date);
    if (response.statusCode == 200) {
      // listBmi = response.data;

      listAppointment.clear();
      listAppointment.addAll(response.data);
      isDateSelected.value = true;
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
