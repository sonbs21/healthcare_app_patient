// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
// import 'package:healthcare_mobile/routes/app_routes.dart';
// import 'package:healthcare_mobile/utils/color.dart';
// import 'package:healthcare_mobile/widgets/custom_app_bar.dart';
// import 'package:healthcare_mobile/widgets/details_info.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class InfoDoctorPage extends StatefulWidget {
//   InfoDoctorPage({Key? key}) : super(key: key);

//   @override
//   State<InfoDoctorPage> createState() => _InfoDoctorPageState();
// }

// var doctorController = Get.find<DoctorController>();

// class _InfoDoctorPageState extends State<InfoDoctorPage> {
//   var fullName = doctorController.doctor.fullName;
//   var specialize = doctorController.doctor.specialize;
//   var workPlace = doctorController.doctor.workPlace;
//   var description = doctorController.doctor.description;
//   var experience = doctorController.doctor.experience;
//   var countPatient = doctorController.doctor.countPatient;
//   var avatar = doctorController.doctor.avatar;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   title: const Text('Bác sĩ'),
//       // ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 1000.h,
//               child: Stack(
//                 children: [
//                   Hero(
//                     tag: "doctor-hero",
//                     child: Container(
//                         height: 900,
//                         width: double.infinity,
//                         child:Image.network(avatar??"https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000")),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Bác sĩ: $fullName",
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                   SizedBox(height: 7.h),
//                   Row(
//                     children: [
//                       Text.rich(
//                         TextSpan(
//                           style: Theme.of(context).textTheme.headline5,
//                           children: [
//                             TextSpan(text: "Khoa: $specialize"),
//                             const TextSpan(text: '  •  '),
//                             TextSpan(text: "Bệnh viện 175"),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.h),
//                   Text('$description'),
//                   SizedBox(height: 20.h),
//                   // const InfoDoctorDetails(),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     height: 100,
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         DetailInfo(
//                           text: "Kinh nghiệm",
//                           number: experience,
//                           subtitle: 'yr',
//                         ),
//                         const VerticalDivider(
//                           indent: 20,
//                           endIndent: 20,
//                           thickness: 1,
//                           color: AppColors.textGrey,
//                         ),
//                         DetailInfo(
//                           text: "Bệnh nhân",
//                           number: "$countPatient",
//                           subtitle: ' ps',
//                         ),
//                         const VerticalDivider(
//                           indent: 20,
//                           endIndent: 20,
//                           thickness: 1,
//                           color: AppColors.textGrey,
//                         ),
//                         const DetailInfo(
//                           text: "Đánh giá",
//                           number: '5.0',
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   Row(
//                     children: [
//                       SizedBox(width: 20.h),
//                       Expanded(
//                         child: Container(
//                           height: 56,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: AppColors.red,
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Hủy bác sĩ",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline5!
//                                   .copyWith(color: AppColors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.h),
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }

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
import 'package:healthcare_mobile/widgets/details_info.dart';

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
                                rating: 4,
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
                                value: countPatient!,
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
