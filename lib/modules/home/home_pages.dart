import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          const SizedBox(
            height: 16.0,
          ),
          _buildFieldSelect('BMI', Colors.grey[400]!),
          const SizedBox(
            height: 16.0,
          ),
          _buildFieldSelect('Huyết áp', Colors.yellow[200]!),
          const SizedBox(
            height: 16.0,
          ),
          _buildFieldSelect('Nhịp tim', Colors.green[100]!),
          const SizedBox(
            height: 16.0,
          ),
          _buildFieldSelect('Glucozo', Colors.blue[100]!)
        ]),
      ),
    );
  }

  _buildFieldSelect(text, color) {
    return Container(
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
    );
  }
}
