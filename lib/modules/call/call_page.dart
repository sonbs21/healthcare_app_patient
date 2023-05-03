import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/call/call_controller.dart';
import 'package:healthcare_mobile/modules/call/widget/default_circle_image.dart';

class CallPage extends StatelessWidget {
  CallPage({Key? key}) : super(key: key);
  var callContronller = Get.find<CallController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Obx(() => Text(
                  callContronller.isReceiver.isTrue
                      ? callContronller.fullNameCaller.value
                      : callContronller.fullNameCallee.value,
                  style: TextStyle(color: Colors.black, fontSize: 39.0),
                )),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            child: callContronller.isReceiver.isTrue
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              callContronller.refuseVideo();
                            },
                            child: const DefaultCircleImage(
                              bgColor: Colors.red,
                              image: Icon(
                                Icons.call_end_rounded,
                                color: Colors.white,
                              ),
                              center: true,
                              width: 55,
                              height: 55,
                            )),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            callContronller.acceptVideo();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) {
                            //     return CallScreen(
                            //         callID: LocalStorageService
                            //             .getConversationCallId());
                            //   }),
                            // );
                          },
                          child: const DefaultCircleImage(
                            bgColor: Colors.green,
                            image: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                            center: true,
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          callContronller.cancelVideo();
                        },
                        child: const DefaultCircleImage(
                          bgColor: Colors.red,
                          image: Icon(
                            Icons.call_end_rounded,
                            color: Colors.white,
                          ),
                          center: true,
                          width: 55,
                          height: 55,
                        )),
                  ),
          ),
        ],
      ),
    );
  }
  // Display remote user's video
}
