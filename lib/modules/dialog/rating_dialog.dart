library rating_bar_swipe;

import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' as rating_bar;
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/utils/color.dart';

class RatingDialog extends StatelessWidget {
  RatingDialog({Key? key, this.id}) : super(key: key);
  String? id;
  RxDouble rate = RxDouble(0.0);
  var doctorController = Get.find<DoctorController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Obx(
      () => Container(
        width: 500,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                ' ${rate.toStringAsFixed(1)}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    rating_bar.RatingBarIndicator(
                      rating: rate.value,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 50,
                      unratedColor: Colors.grey,
                      direction: Axis.horizontal,
                    ),
                    Positioned(
                      bottom: 0,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.transparent,
                          inactiveTrackColor: Colors.transparent,
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 50,
                          disabledThumbColor: Colors.transparent,
                          // thumbColor: Colors.white.withOpacity(0.5) ,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0.0),
                          // overlayColor: Colors.transparent.withAlpha(0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 28.0),
                        ),
                        child: GestureDetector(
                            child: Slider(
                          min: -1,
                          max: 49,
                          divisions: 5 ~/ 1,
                          value: 0,
                          // widget.initialRating,
                          onChangeEnd: (double value) async {},
                          onChangeStart: (double value) {},
                          onChanged: (double value) {
                            if (value < 50) {
                              value++;
                            }
                            log(value.toString());
                            // widget.functionUpdateRating(value);
                            // setState(() {
                            rate.value = (value / 10);
                            // });
                          },
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SizedBox(width: 20.h),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Double r = (rate / 10) as Double;
                      doctorController.postRating(id!, rate.toStringAsFixed(1));
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Đánh giá",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
