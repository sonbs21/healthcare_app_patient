library fancy_dialog;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:intl/intl.dart';

// import 'FancyGif.dart';

const testKeys = [Key("fancyButtons"), Key("flatButtons")];

class RecordDialog extends StatefulWidget {
  const RecordDialog(
      {Key? key,
      this.messageBmi,
      this.indexBmi,
      this.statusBmi,
      this.cholesterol,
      this.messageCholesterol,
      this.statusCholesterol,
      this.glucose,
      this.messageGlucose,
      this.statusGlucose,
      this.heartRateIndicator,
      this.messageHeartbeat,
      this.statusHeartbeat,
      this.systolic,
      this.diastolic,
      this.messageBloodPressure,
      this.statusBloodPressure,
      this.status,
      this.createdAt,
      this.okFun,
      this.titleTextStyle = const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      this.descriptionTextStyle =
          const TextStyle(color: Colors.grey, fontSize: 18),
      this.cancelFun,
      this.animationType = 1,
      // this.gifPath = FancyGif.MOVE_FORWARD,
      this.cancelColor = Colors.grey,
      this.okColor = Colors.pink,
      this.cancel = "Hủy lịch hẹn",
      this.ok = "Đóng",
      this.defaultButtons = true,
      this.actionButtons,
      this.theme = 0 //default theme is fancy
      })
      : super(key: key);

  final String? messageBmi;
  final String? indexBmi;
  final String? statusBmi;
  final String? cholesterol;
  final String? messageCholesterol;
  final String? statusCholesterol;
  final String? glucose;
  final String? statusGlucose;
  final String? messageGlucose;
  final String? heartRateIndicator;
  final String? statusHeartbeat;
  final String? messageHeartbeat;
  final String? systolic;
  final String? diastolic;
  final String? messageBloodPressure;
  final String? statusBloodPressure;
  final String? status;
  final DateTime? createdAt;
  final Function? okFun;
  final Function? cancelFun;
  final int? animationType;
  // final String? gifPath;
  final Color? okColor;
  final Color? cancelColor;
  final String? ok;
  final String? cancel;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;
  final int? theme; // 0: fancy , 1:flat
  final bool defaultButtons;
  final Widget? actionButtons;

  @override
  GifDialogState createState() {
    return GifDialogState();
  }
}

class GifDialogState extends State<RecordDialog> with TickerProviderStateMixin {
  AnimationController? ac;
  Animation? animation;
  double? width;
  double? height;
  int animationAxis = 0; // 0 for x 1 for y

  String? messageBmi;
  String? indexBmi;
  String? statusBmi;
  String? cholesterol;
  String? messageCholesterol;
  String? statusCholesterol;
  String? glucose;
  String? statusGlucose;
  String? messageGlucose;
  String? heartRateIndicator;
  String? statusHeartbeat;
  String? messageHeartbeat;
  String? systolic;
  String? diastolic;
  String? messageBloodPressure;
  String? statusBloodPressure;
  String? status;
  DateTime? createdAt;
  Function? okFun;
  Function? cancelFun;
  // String? gifPath;
  Color? okColor;
  Color? cancelColor;
  TextStyle? titleTextStyle;
  TextStyle? descriptionTextStyle;
  String? ok;
  String? cancel;
  String? id;
  int? theme;
  bool? defaultButtons;
  Widget? actionButtons;
  int package = 0; //0 user assets ,1 package assets

  @override
  void initState() {
    messageBmi = widget.messageBmi;
    statusBmi = widget.statusBmi;
    indexBmi = widget.indexBmi;
    glucose = widget.glucose;
    messageGlucose = widget.messageGlucose;
    statusGlucose = widget.statusGlucose;
    cholesterol = widget.cholesterol;
    messageCholesterol = widget.messageCholesterol;
    statusCholesterol = widget.statusCholesterol;
    heartRateIndicator = widget.heartRateIndicator;
    statusHeartbeat = widget.statusHeartbeat;
    messageHeartbeat = widget.messageHeartbeat;
    systolic = widget.systolic;
    diastolic = widget.diastolic;
    messageBloodPressure = widget.messageBloodPressure;
    statusBloodPressure = widget.statusBloodPressure;
    status = widget.status;
    createdAt = widget.createdAt;
    okFun = widget.okFun ?? () {};
    cancelFun = widget.cancelFun ?? () {};
    okColor = widget.okColor;
    cancelColor = widget.cancelColor;
    // gifPath = widget.gifPath;
    ok = widget.ok;
    cancel = widget.cancel;
    theme = widget.theme;
    titleTextStyle = widget.titleTextStyle;
    descriptionTextStyle = widget.descriptionTextStyle;
    defaultButtons = widget.defaultButtons;
    actionButtons = widget.actionButtons;

    double? start;
    int animationType = widget.animationType!;

    //   ac!.forward();
    super.initState();
  }

  var doctorController = Get.find<DoctorController>();

  @override
  Widget build(BuildContext context) {
    DateTime? date = createdAt;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    String heartbeatStatus = '';
    String cholesterolStatus = '';
    String glucoseStatus = '';
    String bloodPressureStatus = '';
    String bmiStatus = '';
    Color? colorHeartbeatStatus = Colors.white;
    Color? colorCholesterolStatus = Colors.white;
    Color? colorGlucoseStatus = Colors.white;
    Color? colorBloodPressureStatus = Colors.white;
    Color? colorBmiStatus = Colors.white;

    switch (statusHeartbeat) {
      case 'SAFE':
        heartbeatStatus = 'An toàn';
        colorHeartbeatStatus = Colors.green[600];
        break;
      case 'DANGER':
        heartbeatStatus = 'Báo động';
        colorHeartbeatStatus = Colors.yellow[600];
        break;
      case 'CRITIAL':
        heartbeatStatus = 'Nguy hiểm';
        colorHeartbeatStatus = Colors.red[600];
        break;
      default:
        break;
    }

    switch (statusGlucose) {
      case 'SAFE':
        glucoseStatus = 'An toàn';
        colorGlucoseStatus = Colors.green[600];
        break;
      case 'DANGER':
        glucoseStatus = 'Báo động';
        colorGlucoseStatus = Colors.yellow[600];
        break;
      case 'CRITIAL':
        glucoseStatus = 'Nguy hiểm';
        colorGlucoseStatus = Colors.red[600];
        break;
      default:
        break;
    }

    switch (statusCholesterol) {
      case 'SAFE':
        cholesterolStatus = 'An toàn';
        colorCholesterolStatus = Colors.green[600];
        break;
      case 'DANGER':
        cholesterolStatus = 'Báo động';
        colorCholesterolStatus = Colors.yellow[600];
        break;
      case 'CRITIAL':
        cholesterolStatus = 'Nguy hiểm';
        colorCholesterolStatus = Colors.red[600];
        break;
      default:
        break;
    }

    switch (statusBloodPressure) {
      case 'SAFE':
        bloodPressureStatus = 'An toàn';
        colorBloodPressureStatus = Colors.green[600];
        break;
      case 'LOW':
        bloodPressureStatus = 'Thấp';
        colorBloodPressureStatus = Colors.red[600];
        break;
      case 'HIGH':
        bloodPressureStatus = 'Cao';
        colorBloodPressureStatus = Colors.red[600];
        break;
      default:
        break;
    }

    switch (statusBmi) {
      case 'GOOD':
        bmiStatus = 'An toàn';
        colorBmiStatus = Colors.green[600];
        break;
      case 'LIGHT':
        bmiStatus = 'Nhẹ cân';
        colorBmiStatus = Colors.red[600];
        break;
      case 'OVERWEIGHT':
        bmiStatus = 'Thừa cân';
        colorBmiStatus = Colors.yellow[600];
        break;
      case 'FAT':
        bmiStatus = 'Béo phí';
        colorBmiStatus = Colors.red[600];
        break;
      default:
        break;
    }

    if (!defaultButtons!)
      assert(actionButtons != null,
          '\n***actionButtons cannot be null when defaultButtons is false***\n');
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var dialogWidth = 0.36 * height!;

    assert(MediaQuery.of(context) != null,
        '\n****context does not contain media query object***\n');
    // assert(title != null, '\n****title is required***\n');
    // assert(notes != null, '\n****description is required***\n');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
              color: Colors.white,
            ),
            width: 550,
            height: 1200,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // image,
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    'Báo cáo sức khỏe ngày ' + inputFormat,
                    style: titleTextStyle,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 25),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('BMI'),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số BMI: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                indexBmi!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Tình trạng chỉ số BMI: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Container(
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorBmiStatus,
                                ),
                                child: Text(
                                  bmiStatus,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Đánh giá chỉ số BMI: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          Text(
                            messageBmi!,
                            style: descriptionTextStyle,
                          ),
                          const SizedBox(height: 15),
                          const Text('Cholesterol'),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số cholesterol: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                cholesterol!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Tình trạng cholesterol: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Container(
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorCholesterolStatus,
                                ),
                                child: Text(
                                  cholesterolStatus,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Đánh giá chỉ số cholesterol: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          Text(
                            messageCholesterol!,
                            style: descriptionTextStyle,
                          ),
                          const SizedBox(height: 15),
                          const Text('Glucose'),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số glucose: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                glucose!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Tình trạng glucose: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Container(
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorGlucoseStatus,
                                ),
                                child: Text(
                                  glucoseStatus,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Đánh giá chỉ số glucose: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          Text(
                            messageGlucose!,
                            style: descriptionTextStyle,
                          ),
                          const SizedBox(height: 15),
                          const Text('Nhịp tim'),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số nhịp tim: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                heartRateIndicator!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Tình trạng nhịp tim: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Container(
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorHeartbeatStatus,
                                ),
                                child: Text(
                                  heartbeatStatus,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Đánh giá chỉ số nhịp tim: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          Text(
                            messageHeartbeat!,
                            style: descriptionTextStyle,
                          ),
                          const SizedBox(height: 15),
                          const Text('Huyết áp'),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số tâm thất: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                systolic!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Chỉ số tâm thu: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Text(
                                diastolic!,
                                style: descriptionTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text(
                                "Tình trạng chỉ số huyết áp: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                textAlign: TextAlign.start,
                                maxLines: 5,
                              ),
                              Container(
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorBloodPressureStatus,
                                ),
                                child: Text(
                                  bloodPressureStatus,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Đánh giá chỉ số huyết áp: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            maxLines: 5,
                          ),
                          Text(
                            messageCholesterol!,
                            style: descriptionTextStyle,
                          ),
                        ],
                      ),
                    )),
                widget.defaultButtons
                    ? Container(
                        child: Row(
                          mainAxisAlignment: theme == 1
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.center,
                          children: <Widget>[
                            customButton(ok!, okColor!, okFun!)
                          ],
                        ),
                      )
                    : actionButtons!
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton(String t, Color c, Function f) {
    return Container(
      child: ElevatedButton(
        key: testKeys[0],
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          primary: c,
        ),
        child: Text(
          t,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () {
          // f();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  // Widget flatButton(String t, Color c, Function f) {
  //   return Container(
  //     child: ElevatedButton(
  //       key: testKeys[1],
  //       child: Text(
  //         t,
  //         style: TextStyle(color: c, fontSize: 15),
  //       ),
  //       onPressed: () {
  //         f();
  //         Navigator.of(context).pop();
  //       },
  //     ),
  //   );
  // }
}
