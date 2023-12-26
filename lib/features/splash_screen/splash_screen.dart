import 'dart:async';

import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/onboarding/OnboardingScreen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.of(context).popAndPushNamed(signInScreen),
    // ); SignInScreen
    Timer(
        const Duration(seconds: 3),
        () => Get.to(() => const OnboardingScreen(),
            transition: Transition.rightToLeftWithFade));
  }

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/splash_screen_background.jpg'),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Center(
          child: SizedBox(
            height: deviceSizeConfig.blockSizeVertical * 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 85.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bollywood',
                      style: GoogleFonts.sanchez(
                        color: colorGoldenYellow,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
