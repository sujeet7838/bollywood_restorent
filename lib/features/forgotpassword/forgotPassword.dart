import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/Commons/password_field.dart';
import 'package:bollybood_restorent/controller/VerifyEmailController.dart';
import 'package:bollybood_restorent/controller/forgotPasswordController.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/features/sign_up_screen/sign_up_screen.dart';
import 'package:bollybood_restorent/features/verify/otpScreen.dart';
import 'package:bollybood_restorent/routing/routing_config.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 85.0,
              padding: const EdgeInsets.only(
                top: 16.0,
                bottom: 0.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: deviceSizeConfig.blockSizeVertical * 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 144,
                              height: 53,
                              child: Image.asset(
                                'assets/logo-short.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'We will send your password to \nregistered email id  ',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 11 * fem,
                                fontWeight: FontWeight.w400,
                                // height: 1.5,
                                color: const Color(0xff595959),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 154,
                              //height: 148 * fem,
                              child: Image.asset(
                                'assets/food.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceSizeConfig.blockSizeVertical * 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Email',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 12 * fem,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: const Color(0xff595959),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF00C0FF)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.grey,
                      controller: emailController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email Address',
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.email_outlined),
                          color: Colors.grey,
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              padding: const EdgeInsets.only(
                //top: 8.0,
                //  bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() => GestureDetector(
                        onTap: () {
                          forgotPasswordController.verifEmail(
                            emailController.text.toString(),
                          );
                        },
                        child: Container(
                          width: 315 * fem,
                          height: 46 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xfff26122),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: forgotPasswordController.isDataLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xffffffff),
                                    ),
                                  )
                                : Text(
                                    'Submit',
                                    style: GoogleFonts.roboto(
                                      fontSize: 15 * fem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.1725 * fem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                          ),
                        ),
                      )),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => const SignInScreen(),
                            transition: Transition.fadeIn);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 11 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff595959),
                          ),
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 11 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xff039789),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
