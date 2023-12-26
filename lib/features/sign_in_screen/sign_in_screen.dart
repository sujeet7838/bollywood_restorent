import 'package:bollybood_restorent/controller/SignInController.dart';
import 'package:bollybood_restorent/features/forgotpassword/forgotPassword.dart';
import 'package:bollybood_restorent/features/sign_up_screen/sign_up_screen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final SignInController signInController = Get.put(SignInController());
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

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
                              height: 5,
                            ),
                            Text(
                              'Login in your existing account',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 15 * fem,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Password',
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF00C0FF)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      obscureText: passwordVisible,
                      controller: passwordController,
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.password),
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          157 * fem, 5 * fem, 0 * fem, 0 * fem),
                      child: GestureDetector(
                        onTap: () {
                          //showMessageDialog(context);
                          Get.to(() => const ForgotPassword(),
                              transition: Transition.fadeIn);
                        },
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff595959),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              //height: deviceSizeConfig.blockSizeVertical * 15.0,
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() => GestureDetector(
                        onTap: () {
                          // passwordController.text.length == 6
                          //     ?
                          signInController.signIn(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                          );
                          // Get.snackbar(
                          //   'Error',
                          //   'Please enter a valid Password',
                          //   snackPosition: SnackPosition.BOTTOM,
                          //   backgroundColor: Colors.red,
                          //   colorText: Colors.white,
                          // );
                        },
                        child: Container(
                          width: 315 * fem,
                          height: 46 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xfff26122),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: signInController.isDataLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xffffffff),
                                    ),
                                  )
                                : Text(
                                    'Login',
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
                        Get.to(() => const SignUpScreen(),
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
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
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
