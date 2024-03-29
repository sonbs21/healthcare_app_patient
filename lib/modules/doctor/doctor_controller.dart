import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/rating/rating_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';

class DoctorController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  final userRepository = Get.find<UserRepository>();
  RxList<DataResponse> listAppointment = RxList<DataResponse>([]);
  RxList<DataDoctorLstResponse> listDoctors = RxList<DataDoctorLstResponse>([]);
  late DataDoctorResponse doctor;
  late PatientResponse? patient;
  var formKey = GlobalKey<FormState>();
  var isButtonLoading = false.obs;
  var dropdownValue = 'Tất cả'.obs;
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var notesController = TextEditingController();
  Position? currentPosition;
  List<Marker> markers = [];
  String? doctorId = "";
  RxInt tmp = 0.obs;

  @override
  void onInit() {
    super.onInit();

    initListAppointment();
    _getCurrentLocation().then((value) => _addMarker(
        LatLng(currentPosition!.latitude, currentPosition!.longitude)));

    if (doctorId == "") {
      getDoctors();
    }
  }

  void changeDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  void _addMarker(LatLng latLng) async {
    // Create a new Places instance
    final places =
        GoogleMapsPlaces(apiKey: "AIzaSyBRm7R6WMe0kidaFKn7LB4V_W3lvX-Ft4w");

    // Perform a nearby search around the current location
    final response = await places.searchNearbyWithRadius(
      Location(
        lat: latLng.latitude,
        lng: latLng.longitude,
      ),
      5000,
      type: "hospital",
    );

    // Clear the existing markers
    markers.clear();

    // Add a marker for each result
    for (var result in response.results) {
      markers.add(
        Marker(
          markerId: MarkerId(result.placeId),
          position: LatLng(
            result.geometry?.location.lat ?? 0,
            result.geometry?.location.lng ?? 0,
          ),
          infoWindow: InfoWindow(
            title: result.name,
            snippet: result.vicinity,
          ),
        ),
      );
    }

    // setState(() {});
  }

  void initListAppointment() async {
    final response2 = await userRepository.getMe();
    if (response2.statusCode == 200) {
      doctorId = response2.data?.patient?.doctorId;
      if (doctorId == "") {
        return;
      }
      patient = response2.data?.patient!;
      fullNameController.text = patient?.fullName ?? '';
      phoneController.text = patient?.phone ?? '';
    }
    final response =
        await appointmentRepository.getAppointmentPatient(1, 10, null);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listAppointment.clear();
      listAppointment.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }

    final response3 = await userRepository.getDoctorById(doctorId!);
    if (response3.statusCode == 200) {
      doctor = response3.data!;
    }

    check();
  }

  void initNewAppointment(String? status) async {
    final response =
        await appointmentRepository.getAppointmentPatient(1, 10, status);
    if (response.statusCode == 200) {
      // listBmi = response.data;

      listAppointment.clear();
      listAppointment.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }

    check();
  }

  void getDoctors() async {
    final response = await userRepository.getDoctors(1, 10);
    if (response.statusCode == 200) {
      // listBmi = response.data;

      listDoctors.clear();
      listDoctors.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void revokeDoctors() async {
    final response = await userRepository
        .revokeDoctor()
        .then((value) => Get.offAllNamed(AppRoutes.SELECT_DOCTOR_PAGE));
  }

  void postAppointment(String fullName, String phone, DateTime dateMeeting,
      String timeMeeting, String notes) async {
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;
      try {
        await appointmentRepository
            .postAppointment(AppointmentRequest(
          fullName: fullName,
          phone: phone,
          dateOfBirth: patient!.dateOfBirth,
          dateMeeting: dateMeeting,
          notes: notes,
          timeMeeting: timeMeeting,
        ))
            .then((value) {
          initListAppointment();
          check();
        });
      } on DioError catch (e) {
        isButtonLoading.value = false;

        // EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }

  void cancelAppointment(String id) async {
    try {
      await appointmentRepository.cancelAppointment(id).then((value) {
        check();
      });
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  void postRating(String _doctorId, String rating) async {
    try {
      await userRepository
          .postRating(RatingRequest(doctorId: _doctorId, rating: rating))
          .then((value) async {
        final response = await userRepository.getDoctorById(_doctorId);
      });
    } on DioError catch (e) {
      print(e.message);
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  Future<void> refreshListAppointment() async {
    // Thực hiện công việc làm mới, ví dụ: gọi lại API hoặc thực hiện tác vụ khác

    // Đợi một khoảng thời gian giả lập (ví dụ: 2 giây) để tải lại dữ liệu
    await Future.delayed(Duration(seconds: 2));

    // Đánh dấu làm mới hoàn thành bằng cách gọi phương thức refreshCompleted()
    // refreshCompleted();

    // Thực hiện các công việc cần thiết để làm mới dữ liệu
    initListAppointment();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
  }

  void check() {
    print("value.statusAppointment:${listAppointment}");

    for (var value in listAppointment) {
      tmp.value = 0;
      print("value.statusAppointment:${value.statusAppointment}");
      if (value.statusAppointment == "CREATED" ||
          value.statusAppointment == "APPROVED") {
        tmp.value = tmp.value + 1;
      }
    }
    print("value.statusAppointment:${tmp.value}");
  }
}
