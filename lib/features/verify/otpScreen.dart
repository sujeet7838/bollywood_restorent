// ignore_for_file: camel_case_types
import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/controller/OtpController.dart';
import 'package:bollybood_restorent/features/Home/app_home_screen.dart';
import 'package:bollybood_restorent/features/Home/home.dart';
import 'package:bollybood_restorent/features/sign_up_screen/sign_up_screen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class otpScreen extends StatefulWidget {
  const otpScreen({
    super.key,
    required this.email,
    required this.otp,
  });
  final String email;
  final String otp;

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  bool flag = false;
  // final int _duration = 15;
  // final CountDownController _controller = CountDownController();
  final OTPController otpController = Get.put(OTPController());

  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onOtpChanged(int index) {
    if (controllers[index].text.length == 1) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
      }
    } else if (controllers[index].text.isEmpty) {
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  String getOtpFromBoxes() {
    String otp = '';
    for (var controller in controllers) {
      otp += controller.text;
    }
    return otp;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.otp.toString());
  }

  @override
  Widget build(BuildContext context) {
    // final MediaQueryData mediaQuery = MediaQuery.of(context);
    // final double screenWidth = mediaQuery.size.width;
    // final double screenHeight = mediaQuery.size.height;
    // final double fem = screenWidth / 375.0;
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
                // bottom: 0.0,
                //left: 32.0,
                //right: 32.0,
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
                              // width: 144,
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
                              'We will send 4 digit code to your email \nfor the verification ',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 12 * fem,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: const Color(0xff595959),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 154,
                              //height: 148 * fem,
                              child: Image.asset(
                                'assets/food.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(38, 0, 20, 30),
                              //width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(4, (index) {
                                  return Container(
                                    width: 48,
                                    height: 61,
                                    margin: EdgeInsets.only(
                                        right: index < 3 ? 35 : 0),
                                    child: TextField(
                                      autofillHints: [widget.otp],
                                      controller: controllers[index],
                                      focusNode: focusNodes[index],
                                      onChanged: (value) {
                                        onOtpChanged(index);
                                      },
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffe6eaef),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(38, 0, 20, 30),
            //   width: double.infinity,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: List.generate(4, (index) {
            //       return Container(
            //         width: 48,
            //         height: 61,
            //         margin: EdgeInsets.only(right: index < 3 ? 35 : 0),
            //         child: TextField(
            //           controller: controllers[index],
            //           focusNode: focusNodes[index],
            //           onChanged: (value) {
            //             onOtpChanged(index);
            //           },
            //           keyboardType: TextInputType.number,
            //           maxLength: 1,
            //           textAlign: TextAlign.center,
            //           style: const TextStyle(fontSize: 18),
            //           decoration: InputDecoration(
            //             counterText: '',
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: BorderSide.none,
            //             ),
            //             filled: true,
            //             fillColor: const Color(0xffe6eaef),
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              padding: const EdgeInsets.only(
                //top: 8.0,
                // bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        // showMessageDialog(context);
                        // Get.to(() => const AppHomeScreen(),
                        //     transition: Transition.fadeIn);
                        otpController.verifyOTP(
                          widget.email,
                          int.parse(getOtpFromBoxes()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimaryBlack,
                        foregroundColor: Colors.white,
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        minimumSize: Size(
                          double.infinity,
                          deviceSizeConfig.blockSizeVertical * 6.5,
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                        ),
                      ),
                      child: otpController.isDataLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xffffffff),
                              ),
                            )
                          : const Text(
                              'Continue',
                            ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen(),
                            transition: Transition.fadeIn);
                        // Navigator.of(context).pushNamed(signUpScreen);
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
                            // height: 1.5 * ffem / fem,
                            color: const Color(0xff595959),
                          ),
                          children: [
                            const TextSpan(
                              text: 'Don’t have any account? ',
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w700,
                                //height: 1.5 * ffem / fem,
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

    //  TextButton(
    //   onPressed: () {},
    //   style: TextButton.styleFrom(
    //     padding: EdgeInsets.zero,
    //   ),
    //   child: Container(
    //     width: double.infinity,
    //     height: screenHeight,
    //     decoration: const BoxDecoration(
    //       color: Color(0xffffffff),
    //     ),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Container(
    //             margin: EdgeInsets.fromLTRB(0, 0, 0 * fem, 0),
    //             child: Text(
    //               'Verification Code',
    //               style: GoogleFonts.nunitoSans(
    //                 fontSize: 26 * fem,
    //                 fontWeight: FontWeight.w600,
    //                 color: const Color(0xff282828),
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin:
    //                 EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
    //             child: Text(
    //               'Enter the 4 digit code that your received on \nyour e-mail',
    //               style: GoogleFonts.nunitoSans(
    //                 fontSize: 16 * fem,
    //                 color: const Color(0xffaaaaaa),
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.fromLTRB(38, 0, 20, 30),
    //             width: double.infinity,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: List.generate(4, (index) {
    //                 return Container(
    //                   width: 48,
    //                   height: 61,
    //                   margin: EdgeInsets.only(right: index < 3 ? 35 : 0),
    //                   child: TextField(
    //                     controller: controllers[index],
    //                     focusNode: focusNodes[index],
    //                     onChanged: (value) {
    //                       onOtpChanged(index);
    //                     },
    //                     keyboardType: TextInputType.number,
    //                     maxLength: 1,
    //                     textAlign: TextAlign.center,
    //                     style: const TextStyle(fontSize: 18),
    //                     decoration: InputDecoration(
    //                       counterText: '',
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       filled: true,
    //                       fillColor: const Color(0xffe6eaef),
    //                     ),
    //                   ),
    //                 );
    //               }),
    //             ),
    //           ),
    //           Container(
    //             margin:
    //                 EdgeInsets.fromLTRB(31 * fem, 0 * fem, 0 * fem, 0 * fem),
    //             width: 583 * fem,
    //             height: 295 * fem,
    //             child: Stack(
    //               children: [
    //                 Positioned(
    //                   left: 0 * fem,
    //                   top: 73 * fem,
    //                   child: GestureDetector(
    //                     onTap: () async {
    //                       // print(getOtpFromBoxes());
    //                       // signInController.validateOTP(
    //                       //     widget.id, int.parse(getOtpFromBoxes()));
    //                     },
    //                     child: Container(
    //                       width: 320 * fem,
    //                       height: 46 * fem,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(),
    //                         color: const Color(0xff002a5a),
    //                         borderRadius: BorderRadius.circular(6 * fem),
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           'Continue',
    //                           textAlign: TextAlign.center,
    //                           style: GoogleFonts.roboto(
    //                             fontSize: 18 * fem,
    //                             fontWeight: FontWeight.w500,
    //                             height: 1.1725 * fem / fem,
    //                             color: const Color(0xffffffff),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
