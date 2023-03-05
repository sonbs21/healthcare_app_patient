import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/utils/color.dart';
import 'package:healthcare_mobile/utils/theme.dart';
import 'package:healthcare_mobile/utils/extention.dart';
import 'package:healthcare_mobile/utils/text_style.dart';
import 'package:healthcare_mobile/widgets/progress_widget.dart';
import 'package:healthcare_mobile/widgets/rating_start.dart';
import 'package:nb_utils/nb_utils.dart';

class InfoDoctorPage extends StatefulWidget {
  InfoDoctorPage({Key? key}) : super(key: key);
  // final DoctorModel model;

  @override
  _InfoDoctorPageState createState() => _InfoDoctorPageState();
}

var doctorController = Get.find<DoctorController>();

class _InfoDoctorPageState extends State<InfoDoctorPage> {
  // DoctorModel model;
  var fullName = doctorController.doctor.fullName;
  var specialize = doctorController.doctor.specialize;
  var workPlace = doctorController.doctor.workPlace;
  var description = doctorController.doctor.description;
  var experience = doctorController.doctor.experience;
  var countPatient = doctorController.doctor.countPatient;
  var avatar = doctorController.doctor.avatar;
  @override
  void initState() {
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        // IconButton(
        //     icon: Icon(
        //       model.isfavourite ? Icons.favorite : Icons.favorite_border,
        //       color: model.isfavourite ? Colors.red : LightColor.grey,
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         model.isfavourite = !model.isfavourite;
        //       });
        //     })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network(
                "https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000"),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: const EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16), //symmetric(horizontal: 19, vertical: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                fullName!,
                                style: titleStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                              const Spacer(),
                              RatingStar(
                                rating: 4.5,
                              )
                            ],
                          ),
                          subtitle: Text(
                            specialize!,
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                        ),
                        const Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Row(
                          children: <Widget>[
                            const Spacer(),
                            ProgressWidget(
                                value: experience.toDouble(),
                                totalValue: 100,
                                activeColor: LightColor.purpleExtraLight,
                                backgroundColor:
                                    LightColor.grey.withOpacity(.3),
                                title: "Kinh nghiệm",
                                durationTime: 900),
                            const Spacer(),
                            ProgressWidget(
                                // value: countPatient!,
                                value: 50,
                                totalValue: 100,
                                activeColor: LightColor.purpleLight,
                                backgroundColor:
                                    LightColor.grey.withOpacity(.3),
                                title: "Bệnh nhân",
                                durationTime: 300),
                            const Spacer(),
                          ],
                        ),
                        const Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Text("Bệnh viện", style: titleStyle).vP16,
                        Text(
                          workPlace!,
                          style: TextStyles.body.bold,
                        ),
                        Text("Mô tả", style: titleStyle).vP16,
                        Text(
                          description!,
                          style: TextStyles.body.subTitleColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width: 20.h),
                            Expanded(
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    "Hủy bác sĩ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
//                     ],
                          ],
                        ).vP16
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }
}
