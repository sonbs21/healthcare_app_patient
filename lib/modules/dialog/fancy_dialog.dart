library fancy_dialog;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'FancyGif.dart';

const testKeys = [Key("fancyButtons"), Key("flatButtons")];

class FancyDialog extends StatefulWidget {
  const FancyDialog(
      {Key? key,
      this.title,
      this.notes,
      this.fullName,
      this.phone,
      this.timeMeeting,
      this.statusAppointment,
      this.doctorName,
      this.dateMeeting,
      this.dateOfBirth,
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
      this.id,
      this.theme = 0 //default theme is fancy
      })
      : super(key: key);

  final String? title;
  final String? notes;
  final String? fullName;
  final String? phone;
  final String? timeMeeting;
  final String? statusAppointment;
  final String? doctorName;
  final DateTime? dateMeeting;
  final DateTime? dateOfBirth;
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
  final String? id;

  @override
  GifDialogState createState() {
    return GifDialogState();
  }
}

class GifDialogState extends State<FancyDialog> with TickerProviderStateMixin {
  AnimationController? ac;
  Animation? animation;
  double? width;
  double? height;
  int animationAxis = 0; // 0 for x 1 for y

  String? title;
  String? notes;
  String? fullName;
  String? phone;
  String? timeMeeting;
  String? statusAppointment;
  String? doctorName;
  DateTime? dateMeeting;
  DateTime? dateOfBirth;
  Function? okFun;
  Function? cancelFun;
  // String? gifPath;
  Color? okColor;
  Color? cancelColor;
  TextStyle? titleTextStyle;
  TextStyle? descriptionTextStyle;
  String? ok;
  String? cancel;
  int? theme;
  bool? defaultButtons;
  Widget? actionButtons;
  int package = 0; //0 user assets ,1 package assets

  @override
  void initState() {
    title = widget.title;
    notes = widget.notes;
    fullName = widget.fullName;
    phone = widget.phone;
    timeMeeting = widget.timeMeeting;
    statusAppointment = widget.statusAppointment;
    doctorName = widget.doctorName;
    dateMeeting = widget.dateMeeting;
    dateOfBirth = widget.dateOfBirth;
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

  @override
  Widget build(BuildContext context) {
    DateTime? date = dateMeeting;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    String appointmentStatus = '';
    Color? colorStatus = Colors.white;

    switch (statusAppointment) {
      case 'CREATED':
        appointmentStatus = 'Đang chờ';
        colorStatus = Colors.yellow[600];
        break;
      case 'APPROVED':
        appointmentStatus = 'Chấp nhận';
        colorStatus = Colors.green[600];
        break;
      case 'REFUSED':
        appointmentStatus = 'Từ chối';
        colorStatus = Colors.red[600];
        break;
      case 'CANCELED':
        appointmentStatus = 'Đã hủy';
        colorStatus = Colors.grey[600];
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
    assert(title != null, '\n****title is required***\n');
    assert(notes != null, '\n****description is required***\n');
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
            color: Colors.white,
          ),
          width: 500,
          height: 450,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // image,
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  title!,
                  style: titleTextStyle,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 10, 25),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Họ tên: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              fullName!,
                              style: descriptionTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Số điện thoại: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              phone!,
                              style: descriptionTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Trạng thái: ",
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
                                color: colorStatus,
                              ),
                              child: Text(
                                appointmentStatus,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Ngày hẹn: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              inputFormat,
                              style: descriptionTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Giờ hẹn: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              timeMeeting!,
                              style: descriptionTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Bác sĩ phụ trách: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                              maxLines: 5,
                            ),
                            Text(
                              doctorName!,
                              style: descriptionTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Mô tả: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.start,
                          maxLines: 5,
                        ),
                        Text(
                          notes!,
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
                          theme == 0
                              ? customButton(cancel!, cancelColor!, cancelFun!)
                              : flatButton(cancel!, cancelColor!, cancelFun!),
                          SizedBox(
                            width: 20,
                          ),
                          theme == 0
                              ? customButton(ok!, okColor!, okFun!)
                              : flatButton(ok!, okColor!, okFun!)
                        ],
                      ),
                    )
                  : actionButtons!
            ],
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
          f();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget flatButton(String t, Color c, Function f) {
    return Container(
      child: ElevatedButton(
        key: testKeys[1],
        child: Text(
          t,
          style: TextStyle(color: c, fontSize: 15),
        ),
        onPressed: () {
          f();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
