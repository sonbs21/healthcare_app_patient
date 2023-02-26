import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_mobile/modules/home/home_table.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/widgets/tabbar_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Sức khỏe',
        tabs: [
          Tab(icon: Icon(Icons.table_chart), text: 'Bảng'),
          Tab(icon: Icon(Icons.bar_chart), text: 'Biểu đồ'),
        ],
        children: [
          HomeTable(),
          SafeArea(
            child: ListView(padding: const EdgeInsets.all(16), children: [
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'BMI',
                Colors.grey[400]!,
                () {
                  Get.toNamed(AppRoutes.BMI_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Huyết áp',
                Colors.yellow[200]!,
                () {
                  Get.toNamed(AppRoutes.BLOOD_PRESSURE_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Nhịp tim',
                Colors.green[100]!,
                () {
                  Get.toNamed(AppRoutes.HEARTBEAT_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Glucose',
                Colors.blue[100]!,
                () {
                  Get.toNamed(AppRoutes.GLUCOSE_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Cholesterol',
                Colors.orange[200]!,
                () {
                  Get.toNamed(AppRoutes.CHOLESTEROL_PAGE);
                },
              )
            ]),
          ),
        ],
      );
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       actions: [
  //         IconButton(
  //             onPressed: () {
  //               Get.toNamed(AppRoutes.HEALTH_RECORD_PAGE);
  //             },
  //             icon: const Icon(Icons.add_circle_outline))
  //       ],
  //       title: const Text('Sức khỏe'),
  //     ),
  //     body: SafeArea(
  //       child: ListView(padding: const EdgeInsets.all(16), children: [
  //         const SizedBox(
  //           height: 16.0,
  //         ),
  //         _buildFieldSelect(
  //           'BMI',
  //           Colors.grey[400]!,
  //           () {
  //             Get.toNamed(AppRoutes.BMI_PAGE);
  //           },
  //         ),
  //         const SizedBox(
  //           height: 16.0,
  //         ),
  //         _buildFieldSelect(
  //           'Huyết áp',
  //           Colors.yellow[200]!,
  //           () {
  //             Get.toNamed(AppRoutes.BLOOD_PRESSURE_PAGE);
  //           },
  //         ),
  //         const SizedBox(
  //           height: 16.0,
  //         ),
  //         _buildFieldSelect(
  //           'Nhịp tim',
  //           Colors.green[100]!,
  //           () {
  //             Get.toNamed(AppRoutes.HEARTBEAT_PAGE);
  //           },
  //         ),
  //         const SizedBox(
  //           height: 16.0,
  //         ),
  //         _buildFieldSelect(
  //           'Glucose',
  //           Colors.blue[100]!,
  //           () {
  //             Get.toNamed(AppRoutes.GLUCOSE_PAGE);
  //           },
  //         ),
  //         const SizedBox(
  //           height: 16.0,
  //         ),
  //         _buildFieldSelect(
  //           'Cholesterol',
  //           Colors.orange[200]!,
  //           () {
  //             Get.toNamed(AppRoutes.CHOLESTEROL_PAGE);
  //           },
  //         )
  //       ]),
  //     ),
  //   );
  // }

  _buildFieldSelect(text, color, VoidCallback press) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.2,
          ),
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    color: black,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.chevron_forward,
              color: black,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
