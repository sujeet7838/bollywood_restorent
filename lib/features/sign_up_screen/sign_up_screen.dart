import 'package:bollybood_restorent/controller/SignUpController.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SignUpController signUpController = Get.put(SignUpController());
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    //bool isTextObscure = ref.watch(obscureTextStateProvider).isTextObscure;
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
                              'Create an account to bollywood \nto get all features',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 12 * fem,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: const Color(0xff595959),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'First Name',
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
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      controller: fNameController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First name',
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person),
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
                      'Last Name',
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
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      controller: lNameController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last Name',
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person),
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
                      'Phone',
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
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      controller: phoneController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone number',
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone),
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
                  // const PasswordField(),
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
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      controller: passwordController,
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
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              padding: const EdgeInsets.only(
                // top: 8.0,
                // bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() => GestureDetector(
                        onTap: () {
                          signUpController.signUp(
                            fNameController.text.toString(),
                            lNameController.text.toString(),
                            emailController.text.toString(),
                            phoneController.text.toString(),
                            passwordController.text.toString(),
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
                            child: signUpController.isDataLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xffffffff),
                                    ),
                                  )
                                : Text(
                                    'Create',
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
                            fontSize: 12 * ffem,
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
                                fontSize: 14 * ffem,
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
