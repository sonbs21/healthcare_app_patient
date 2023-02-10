import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Text('Personal Page')),
    );
  }
}
