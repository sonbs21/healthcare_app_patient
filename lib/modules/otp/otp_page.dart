import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/auth_button.dart';
import 'package:healthcare_mobile/modules/sign_up/sign_up_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

enum Gender { MALE, FEMALE }

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  String text = '';
  void _onKeyboardTap(String value) {
    text = text + value;
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // key: loginStore.otpScaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Color(0xFF6252A7).withAlpha(20),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF503E9D),
              size: 16,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                'Enter 6 digits verification code sent to your number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500))),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              otpNumberWidget(0),
                              otpNumberWidget(1),
                              otpNumberWidget(2),
                              otpNumberWidget(3),
                              otpNumberWidget(4),
                              otpNumberWidget(5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //   constraints: const BoxConstraints(
                  //       maxWidth: 500
                  //   ),
                  //   child: RaisedButton(
                  //     onPressed: () {
                  //       // loginStore.validateOtpAndLogin(context, text);
                  //     },
                  //     color: MyColors.primaryColor,
                  //     shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(14))
                  //     ),
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: <Widget>[
                  //           Text('Confirm', style: TextStyle(color: Colors.white),),
                  //           Container(
                  //             padding: const EdgeInsets.all(8),
                  //             decoration: BoxDecoration(
                  //               borderRadius: const BorderRadius.all(Radius.circular(20)),
                  //               color: MyColors.primaryColorLight,
                  //             ),
                  //             child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // NumericKeyboard(
                  //   onKeyboardTap: _onKeyboardTap,
                  //   textColor: MyColors.primaryColorLight,
                  //   rightIcon: Icon(
                  //     Icons.backspace,
                  //     color: MyColors.primaryColorLight,
                  //   ),
                  //   rightButtonFn: () {
                  //     setState(() {
                  //       text = text.substring(0, text.length - 1);
                  //     });
                  //   },
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
