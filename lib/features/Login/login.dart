import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(30 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2 * fem),
              width: 375 * fem,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        103 * fem, 0 * fem, 118 * fem, 112 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              3 * fem, 0 * fem, 3 * fem, 18 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 7 * fem),
                                width: 144 * fem,
                                height: 53 * fem,
                                child: Image.asset(
                                  'assets/logo-short.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Login in your existing account',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 9 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff595959),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 154 * fem,
                          //height: 148 * fem,
                          child: Image.asset(
                            'assets/food.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10 * fem,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        45 * fem, 0 * fem, 60 * fem, 5 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 66 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 28 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 270 * fem,
                                  height: 38 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10 * fem),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x19000000),
                                          offset: Offset(0 * fem, 0 * fem),
                                          blurRadius: 7.5 * fem,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15 * fem,
                              //top: 6 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 54 * fem,
                                  height: 17 * fem,
                                  child: Text(
                                    'Name',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xffafafaf),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              //width: 300.67 * fem,
                              // height: 25.5 * fem,
                              child: TextField(
                                // controller: fullNameController,
                                showCursor: true,
                                decoration: InputDecoration(
                                  hintText: 'Your Full Name',
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    height: 3 * fem,
                                    color: const Color(0xffC1C7D0),
                                  ),
                                  prefixIcon: Container(
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/user-avatar.png",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        45 * fem, 0 * fem, 60 * fem, 5 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 66 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 28 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 270 * fem,
                                  height: 38 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10 * fem),
                                      color: const Color(0xffffffff),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x19000000),
                                          offset: Offset(0 * fem, 0 * fem),
                                          blurRadius: 7.5 * fem,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15 * fem,
                              top: 6 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 54 * fem,
                                  height: 17 * fem,
                                  child: Text(
                                    'Password',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 11 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xffafafaf),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // iconpasswordpass44y (122:613)
                              left: 15 * fem,
                              top: 40 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 18.5 * fem,
                                  height: 14.9 * fem,
                                  child: Image.asset(
                                    'assets/icon-password-pass.png',
                                    width: 18.5 * fem,
                                    height: 14.9 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // 9s7 (122:619)
                              left: 50 * fem,
                              top: 9 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 69 * fem,
                                  height: 54 * fem,
                                  child: Text(
                                    '.........',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 36 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xffafafaf),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // iconeyeemptyfaZ (122:630)
                              left: 235 * fem,
                              top: 42 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 16 * fem,
                                  height: 10.67 * fem,
                                  child: Image.asset(
                                    'assets/icon-eye-empty.png',
                                    width: 16 * fem,
                                    height: 10.67 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    // forgotpasswordkc1 (122:626)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          157 * fem, 0 * fem, 0 * fem, 50 * fem),
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff595959),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // group25ehP (122:622)
                    margin: EdgeInsets.fromLTRB(
                        49 * fem, 0 * fem, 60 * fem, 17 * fem),
                    width: double.infinity,
                    height: 41 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xfff26122),
                      borderRadius: BorderRadius.circular(50 * fem),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     margin: EdgeInsets.fromLTRB(
                  //         0 * fem, 0 * fem, 14 * fem, 15 * fem),
                  //     child: Text(
                  //       'or connect using',
                  //       textAlign: TextAlign.center,
                  //       style: SafeGoogleFont(
                  //         'Poppins',
                  //         fontSize: 11 * ffem,
                  //         fontWeight: FontWeight.w500,
                  //         height: 1.5 * ffem / fem,
                  //         color: const Color(0xffafafaf),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(
                  //       70 * fem, 0 * fem, 85 * fem, 0 * fem),
                  //   width: double.infinity,
                  //   height: 30 * fem,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(
                  //             0 * fem, 0 * fem, 20 * fem, 0 * fem),
                  //         padding: EdgeInsets.fromLTRB(
                  //             16 * fem, 7 * fem, 16 * fem, 8 * fem),
                  //         width: 100 * fem,
                  //         height: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xff1976d2),
                  //           borderRadius: BorderRadius.circular(7 * fem),
                  //         ),
                  //         child: Container(
                  //           width: double.infinity,
                  //           height: double.infinity,
                  //           child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem,
                  //                     10.16 * fem, 0.75 * fem),
                  //                 width: 7.84 * fem,
                  //                 height: 14.25 * fem,
                  //                 child: Image.asset(
                  //                   'assets/app-screen/images/icon-facebook.png',
                  //                   width: 7.84 * fem,
                  //                   height: 14.25 * fem,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'Facebook',
                  //                 style: SafeGoogleFont(
                  //                   'Poppins',
                  //                   fontSize: 10 * ffem,
                  //                   fontWeight: FontWeight.w500,
                  //                   height: 1.5 * ffem / fem,
                  //                   color: const Color(0xffffffff),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.fromLTRB(
                  //             21 * fem, 7 * fem, 21 * fem, 8 * fem),
                  //         width: 100 * fem,
                  //         height: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xffdd4b39),
                  //           borderRadius: BorderRadius.circular(7 * fem),
                  //         ),
                  //         child: SizedBox(
                  //           width: double.infinity,
                  //           height: double.infinity,
                  //           child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 margin: EdgeInsets.fromLTRB(
                  //                     0 * fem, 0 * fem, 10 * fem, 0 * fem),
                  //                 width: 11 * fem,
                  //                 height: 11 * fem,
                  //                 child: Image.asset(
                  //                   'assets/app-screen/images/icon-google-circled.png',
                  //                   width: 11 * fem,
                  //                   height: 11 * fem,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 // googleRX7 (122:645)
                  //                 'Google',
                  //                 style: SafeGoogleFont(
                  //                   'Poppins',
                  //                   fontSize: 10 * ffem,
                  //                   fontWeight: FontWeight.w500,
                  //                   height: 1.5 * ffem / fem,
                  //                   color: const Color(0xffffffff),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            // Container(
            //   padding:
            //       EdgeInsets.fromLTRB(45 * fem, 0 * fem, 45 * fem, 27 * fem),
            //   width: double.infinity,
            //   height: 133 * fem,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.fromLTRB(
            //             0 * fem, 0 * fem, 0 * fem, 358 * fem),
            //         child: TextButton(
            //           onPressed: () {},
            //           style: TextButton.styleFrom(
            //             padding: EdgeInsets.zero,
            //           ),
            //           child: SizedBox(
            //             width: double.infinity,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Container(
            //                   margin: EdgeInsets.fromLTRB(
            //                       15 * fem, 0 * fem, 0 * fem, 5 * fem),
            //                   child: Text(
            //                     'Name',
            //                     style: SafeGoogleFont(
            //                       'Poppins',
            //                       fontSize: 11 * ffem,
            //                       fontWeight: FontWeight.w500,
            //                       height: 1.5 * ffem / fem,
            //                       color: const Color(0xffafafaf),
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.fromLTRB(
            //                       15 * fem, 11 * fem, 135 * fem, 11 * fem),
            //                   width: double.infinity,
            //                   decoration: BoxDecoration(
            //                     color: const Color(0xffffffff),
            //                     borderRadius: BorderRadius.circular(10 * fem),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: const Color(0x19000000),
            //                         offset: Offset(0 * fem, 0 * fem),
            //                         blurRadius: 7.5 * fem,
            //                       ),
            //                     ],
            //                   ),
            //                   child: Row(
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         margin: EdgeInsets.fromLTRB(
            //                             0 * fem, 0 * fem, 15 * fem, 0 * fem),
            //                         width: 16 * fem,
            //                         height: 16 * fem,
            //                         child: Image.asset(
            //                           'assets/icon-user-circle-alt.png',
            //                           width: 16 * fem,
            //                           height: 16 * fem,
            //                         ),
            //                       ),
            //                       Container(
            //                         margin: EdgeInsets.fromLTRB(
            //                             0 * fem, 0 * fem, 0 * fem, 1 * fem),
            //                         child: TextFormField(
            //                           style: SafeGoogleFont(
            //                             'Poppins',
            //                             fontSize: 10 * ffem,
            //                             fontWeight: FontWeight.w400,
            //                             height: 1.5 * ffem / fem,
            //                             color: const Color(0xffafafaf),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Center(
            //         child: TextButton(
            //           onPressed: () {},
            //           style: TextButton.styleFrom(
            //             padding: EdgeInsets.zero,
            //           ),
            //           child: RichText(
            //             textAlign: TextAlign.center,
            //             text: TextSpan(
            //               style: SafeGoogleFont(
            //                 'Poppins',
            //                 fontSize: 11 * ffem,
            //                 fontWeight: FontWeight.w500,
            //                 height: 1.5 * ffem / fem,
            //                 color: const Color(0xff595959),
            //               ),
            //               children: [
            //                 const TextSpan(
            //                   text: 'Don’t have any account? ',
            //                 ),
            //                 TextSpan(
            //                   text: 'Sign Up',
            //                   style: SafeGoogleFont(
            //                     'Poppins',
            //                     fontSize: 11 * ffem,
            //                     fontWeight: FontWeight.w700,
            //                     height: 1.5 * ffem / fem,
            //                     color: const Color(0xff039789),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
