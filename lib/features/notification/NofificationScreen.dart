import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/banner/first_ad_banner_section.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';

class NofificationScreen extends StatefulWidget {
  const NofificationScreen({
    super.key,
  });

  @override
  State<NofificationScreen> createState() => _NofificationScreenState();
}

class _NofificationScreenState extends State<NofificationScreen> {
  final bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Container(
            width: double.infinity,
            height: 80.0,
            padding: const EdgeInsets.only(),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xfff26122),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 15,
        ),
        Center(
            child: Text(
          "Notification",
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 15 * fem,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: const Color(0xffF26122),
          ),
        ))
      ],
    )));
  }
}
