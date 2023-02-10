import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healcare_mobile/modules/chat/chat_page.dart';
import 'package:healcare_mobile/modules/doctor/doctor_pages.dart';
import 'package:healcare_mobile/modules/home/home_pages.dart';
import 'package:healcare_mobile/modules/personal/personal_pages.dart';
import 'package:healcare_mobile/routes/app_routes.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedPage = 0;
  final pages = [HomePage(), ChatPage(), DoctorPage(), PersonalPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          onTap: (position) {
            setState(() {
              selectedPage = position;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Nhắn tin"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: "Bác sĩ"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân")
          ]),
    );
  }
}
