import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/Api/model/selectLocationModel.dart';
import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var isLoading = false.obs;
  var response;
  var getLocationTypeData;

  late PageController _pageController;
  int currentIndex = 0;
  late int tappedIndex;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    getLocationData();
    tappedIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<dynamic> getLocationData() async {
    try {
      response = await http.get(Uri.parse(ApiProvider.StoreLocation));
      var LocationTypeResponceData = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        setState(() {
          getLocationTypeData = jsonDecode(response.body);
        });

        return SelectLocationModel.fromJson(LocationTypeResponceData);
      } else {
        return SelectLocationModel.fromJson(LocationTypeResponceData);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: '',
                  title: 'Select location',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sem tortor, volutpat et erat vel.'),
              makePage2(
                  // reverse: true,
                  image: 'assets/logo.png',
                  title: 'Select Food',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sem tortor, volutpat et erat vel.'),
              makePage3(
                  image: 'assets/logo.png',
                  title: 'Drop off / Pick up',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sem tortor, volutpat et erat vel.'),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          // const SizedBox(
          //   height: 12.0,
          // ),
          Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
                left: 8,
                right: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 00),
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: coloryellowDark,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SignInScreen(),
                                transition: Transition.fadeIn);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF595959),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 8,
                          color: Color(0xFF595959),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 8,
                          color: Color(0xFF595959),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          !reverse
              ? Column(
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
                                'indian tandoori restaurant \nfully licensed  B.Y.O ',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: const Color(0xff595959),
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              SizedBox(
                                // width: 154,
                                //height: 148 * fem,
                                child: Image.asset(
                                  'assets/intro1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                title,
                style: const TextStyle(
                    color: colorPrimaryBlack,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          reverse
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 25,
                ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    width: 315 * fem,
                    height: 46 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xfff26122),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Select Location',
                        style: GoogleFonts.roboto(
                          fontSize: 15 * fem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * fem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // two intro page
  Widget makePage2({image, title, content, reverse = false}) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          !reverse
              ? Column(
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
                                'indian tandoori restaurant \nfully licensed  B.Y.O ',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: const Color(0xff595959),
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              SizedBox(
                                child: Image.asset(
                                  'assets/intro2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // FadeInUp(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20),
                    //     child: Image.asset(image),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                  ],
                )
              : SizedBox(),
          FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                title,
                style: const TextStyle(
                    color: colorPrimaryBlack,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          reverse
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 25,
                ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //_settingModalBottomSheet(context);
                    Get.to(() => const SignInScreen(),
                        transition: Transition.fadeIn);
                  },
                  child: Container(
                    width: 315 * fem,
                    height: 46 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xfff26122),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Select Location',
                        style: GoogleFonts.roboto(
                          fontSize: 15 * fem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * fem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // three intro page
  Widget makePage3({image, title, content, reverse = false}) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          !reverse
              ? Column(
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
                                'indian tandoori restaurant \nfully licensed  B.Y.O ',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: const Color(0xff595959),
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              SizedBox(
                                // width: 154,
                                //height: 148 * fem,
                                child: Image.asset(
                                  'assets/intro3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Text(
                              //   'Select location',
                              //   textAlign: TextAlign.center,
                              //   style: SafeGoogleFont(
                              //     'Poppins',
                              //     fontSize: 11 * fem,
                              //     fontWeight: FontWeight.w500,
                              //     height: 1.5,
                              //     color: const Color(0xff595959),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // FadeInUp(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20),
                    //     child: Image.asset(image),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                  ],
                )
              : SizedBox(),
          FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xffF37138),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          reverse
              ? Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 25,
                ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignInScreen(),
                        transition: Transition.fadeIn);
                  },
                  child: Container(
                    width: 315 * fem,
                    height: 46 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xfff26122),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Select Location',
                        style: GoogleFonts.roboto(
                          fontSize: 15 * fem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * fem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: const Color(0xfff26122),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
        // print(_indicator(true));
      } else {
        indicators.add(_indicator(false));
        // print(_indicator(false));
      }
    }

    return indicators;
  }

  void _settingModalBottomSheet(context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    int _value = 0;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Location',
                  style: GoogleFonts.roboto(
                    fontSize: 24 * fem,
                    fontWeight: FontWeight.w500,
                    height: 1.1725 * fem / fem,
                    color: const Color(0xffF37138),
                  ),
                ),
              ),
              SizedBox(
                  height: 200 * fem,
                  child: response != null
                      ? ListView.builder(
                          itemCount: getLocationTypeData.length,
                          itemBuilder: (context, index) {
                            var serviceType = getLocationTypeData[index];
                            return Container(
                              color: tappedIndex == index
                                  ? const Color(0xFF039789)
                                  : Colors.white,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tappedIndex = index;
                                    print('${serviceType["id"]}');
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0.0),
                                  child: Card(
                                    color: const Color(0xFFF1F1F1),
                                    elevation: 0,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[300],
                                        child: Image.asset(
                                          "assets/mapicon.png",
                                          scale: 1,
                                        ),
                                      ),
                                      title: Text(
                                        '${serviceType["name"]}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          height: 1.1725,
                                          color: const Color(0xff282828),
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const SizedBox(
                          height: 60.0,
                          child: Center(child: CircularProgressIndicator()),
                        )),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignInScreen(),
                            transition: Transition.fadeIn);
                      },
                      child: Container(
                        width: 315 * fem,
                        height: 46 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xfff26122),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Confirm Location',
                            style: GoogleFonts.roboto(
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w500,
                              height: 1.1725 * fem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
