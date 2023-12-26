import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool isSelected = false;
  var getUserId;
  var userResp, getuserdata;
  String dropdownvalue = 'Bollywood Hastings';
  var items = [
    'Bollywood Hastings',
    'Bollywood Napier',
    'Bollywood Gisborne',
  ];
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getUserId = sharedPreferences.getString("userID");
    getuserDetails(getUserId);
  }

  getuserDetails(getUserId) async {
    try {
      userResp = await http.post(Uri.parse(ApiProvider.userDetails), body: {
        'user_id': getUserId,
      });

      if (userResp.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(userResp.body);
          getuserdata = jsonData['data'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
            width: double.infinity,
            height: 60 * fem,
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
                      scale: 3,
                    ),
                  ),
                  Container(
                    height: 30 * fem,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton(
                      dropdownColor: const Color(0xffF26122),
                      borderRadius: BorderRadius.circular(20),
                      value: dropdownvalue,
                      icon: Image.asset(
                        "assets/arrow_down.png",
                        scale: 1,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/marker.png",
                                scale: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  items,
                                  style: GoogleFonts.roboto(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    height: 1.1725,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
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
          "Profile",
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 15 * fem,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: const Color(0xffF26122),
          ),
        )),
        const SizedBox(
          height: 15,
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              // Get.to(() => projectDashboardScreen(),
              //     transition: Transition.fade);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0),
              child: Card(
                color: const Color(0xFFFFFFFF),
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: Image.asset(
                      "assets/profile_icon.png",
                      scale: 1,
                    ),
                  ),
                  title: Text(
                    "${getuserdata['firstname']} ${getuserdata['lastname']}",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.1725,
                      color: const Color(0xff000000),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${getuserdata['phone']}",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.1725,
                            color: const Color(0xff039789),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Image.asset(
                    "assets/vector.png",
                    scale: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  height: 80 * fem,
                  width: 150 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 238, 223, 216),
                    border: Border.all(
                      color: const Color(0xFFF26122),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon_user.png",
                          scale: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Profile Update",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  height: 80 * fem,
                  width: 150 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 227, 233, 236),
                    border: Border.all(
                      color: const Color(0xFF22A7F2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon_undo.png",
                          scale: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Order History",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  height: 80 * fem,
                  width: 150 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 227, 233, 236),
                    border: Border.all(
                      color: const Color(0xFF22A7F2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/credit_card.png",
                          scale: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Payment Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  height: 80 * fem,
                  width: 150 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 227, 233, 236),
                    border: Border.all(
                      color: const Color(0xFFD11E33),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon _settings.png",
                          scale: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Setting",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100 * fem,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // prefs?.clear();
                  Get.to(() => const SignInScreen(),
                      transition: Transition.fadeIn);
                },
                child: Row(
                  children: [
                    Spacer(),
                    const Icon(
                      Icons.logout,
                      size: 15,
                      color: Color(0xFFAFAFAF),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 25),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.roboto(
                          fontSize: 15 * fem,
                          fontWeight: FontWeight.w500,
                          height: 1.1725 * fem / fem,
                          color: const Color(0xffE81138),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
