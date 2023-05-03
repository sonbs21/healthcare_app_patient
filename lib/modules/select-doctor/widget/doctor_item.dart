import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/modules/select-doctor/select_doctor_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
// import 'avatar_image.dart';
import 'package:intl/intl.dart';

class DoctorItem extends StatelessWidget {
  DoctorItem(this.data, {Key? key, this.onTap}) : super(key: key);
  // final calendarController = Get.find<CalendarController>();
  final selectDoctorController = Get.find<SelectDoctorController>();
  final data;
  final GestureTapCallback? onTap;
  // final direction = AppState.of(context)!.direction;
  @override
  Widget build(BuildContext context) {
    // DateTime? date = data?.dateMeeting;
    // var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    // String timeMeeting = data?.timeMeeting;
    // String? time = '$inputFormat + $timeMeeting';
    // String appointmentStatus = '';
    // Color? colorStatus = Colors.white;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.INFO_SELECT_DOCTOR_PAGE, arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Slidable(
          // key: const ValueKey(1),
          groupTag: '0',
          // direction: direction,
          startActionPane: ActionPane(
            openThreshold: 0.1,
            closeThreshold: 0.4,
            motion: BehindMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check,
                onPressed: (_) {
                  selectDoctorController.selectDoctor(data.id);
                },
              )
            ],
          ),

          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            height: 60,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            child: Text(data.fullName ?? "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)))),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        child: Text(data.workPlace ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(data.specialize ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13))),
                                  ],
                                ),
                              ],
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
