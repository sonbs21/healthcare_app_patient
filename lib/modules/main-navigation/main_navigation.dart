import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/chat_page.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_pages.dart';
import 'package:healthcare_mobile/modules/home/home_controller.dart';
import 'package:healthcare_mobile/modules/home/home_pages.dart';
import 'package:healthcare_mobile/modules/main-navigation/main_navigation_controller.dart';
import 'package:healthcare_mobile/modules/notification/notification_pages.dart';
import 'package:healthcare_mobile/modules/personal/personal_pages.dart';

class MainNavigation extends StatelessWidget {

  int selectedPage = 0;
  final pages = [
    HomePage(),
    ChatPage(),
    DoctorPage(),
    NotificationPage(),
    PersonalPage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              ChatPage(),
              DoctorPage(),
              NotificationPage(),
              PersonalPage()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // unselectedItemColor: Colors.black,
          // selectedItemColor: Colors.redAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,

          showSelectedLabels: true,
          // showUnselectedLabels: false,
          // type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white,
          // elevation: 0,
          type: BottomNavigationBarType.fixed,
          // currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          // onTap: (position) {
          //   setState(() {
          //     selectedPage = position;
          //   });
          // },
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Trang chủ',
            ),
            _bottomNavigationBarItem(
              icon: Icons.message,
              label: 'Hội thoại',
            ),
            _bottomNavigationBarItem(
              icon: Icons.calendar_month,
              label: 'Lịch hẹn',
            ),
            _bottomNavigationBarItem(
              icon: Icons.notifications,
              label: 'Thông báo',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Cá nhân',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}


//  body: ,
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: selectedPage,
//           fixedColor: Colors.blueAccent,
//           unselectedItemColor: Color(0xFF757575),
//           onTap: (position) {
//             setState(() {
//               selectedPage = position;
//             });
//           },
//           items: [
//             _bottomNavigationBarItem(
//               icon: Icons.home,
//               label: 'Trang chủ',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.message,
//               label: 'Hội thoại',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.local_hospital,
//               label: 'Bác sĩ',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.person,
//               label: 'Cá nhân',
//             ),
//           ]),