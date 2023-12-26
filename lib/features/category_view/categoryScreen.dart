import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/banner/first_ad_banner_section.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final bool isSelected = false;
  String dropdownvalue = 'Bollywood Hastings';
  var items = [
    'Bollywood Hastings',
    'Bollywood Napier',
    'Bollywood Gisborne',
  ];
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
                      underline: const SizedBox(),
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
        const FirstAdBannerSection(),
        const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 8,
              right: 8,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: coloryellowDark,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'More',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: colorSkyeBlue,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: colorSkyeBlue,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: colorSkyeBlue,
                      )
                    ],
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 85 * ffem,
          margin: const EdgeInsets.only(left: 15),
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 0.0,
            ),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //showMessageDialog(context);

                  // Get.to(() => CategoryScreen(), transition: Transition.fadeIn);
                },
                child: Container(
                  width: 80 * ffem,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 11.0,
                  ),
                  decoration: BoxDecoration(
                    color: colorLightGoldenYellow,
                    borderRadius: BorderRadius.circular(16.0),
                    border: isSelected == true
                        ? Border.all(
                            color: colorGoldenYellow.withOpacity(0.5),
                            width: 1.5,
                          )
                        : Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/combo-icon.png',
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Combo',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 2.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMessageDialog(context);
                },
                child: Container(
                  width: 80 * ffem,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 11.0,
                  ),
                  decoration: BoxDecoration(
                    color: colorLightGoldenYellow,
                    borderRadius: BorderRadius.circular(16.0),
                    border: isSelected == true
                        ? Border.all(
                            color: colorGoldenYellow.withOpacity(0.5),
                            width: 1.5,
                          )
                        : Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/lunch-icon.png',
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Lunch',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 2.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMessageDialog(context);
                },
                child: Container(
                  width: 80 * ffem,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 11.0,
                  ),
                  decoration: BoxDecoration(
                    color: colorLightGoldenYellow,
                    borderRadius: BorderRadius.circular(16.0),
                    border: isSelected == true
                        ? Border.all(
                            color: colorGoldenYellow.withOpacity(0.5),
                            width: 1.5,
                          )
                        : Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/group-icon.png',
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Lunch',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 2.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMessageDialog(context);
                },
                child: Container(
                  width: 80 * ffem,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 11.0,
                  ),
                  decoration: BoxDecoration(
                    color: colorLightGoldenYellow,
                    borderRadius: BorderRadius.circular(16.0),
                    border: isSelected == true
                        ? Border.all(
                            color: colorGoldenYellow.withOpacity(0.5),
                            width: 1.5,
                          )
                        : Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/chicken-icon.png',
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Chicken',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 2.0,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 8,
              right: 8,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menus',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: coloryellowDark,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'More',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: colorSkyeBlue,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: colorSkyeBlue,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: colorSkyeBlue,
                      )
                    ],
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 150 * ffem,
          height: 50,
          margin: const EdgeInsets.only(
            left: 15,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 0.0,
          ),
          child: ListView(
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 0.0,
            // ),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showMessageDialog(context);
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/rectangle.png',
                        height: 100.0,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Chicken Tikka',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // height: 2.0,
                            color: Colors.black),
                      ),
                      // Text(
                      //   'Chicken marinated in\n spices & roasted in the clay oven..',
                      //   style: SafeGoogleFont('Poppins',
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //       //  height: 2.0,
                      //       color: Colors.black),
                      // )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  showMessageDialog(context);
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/rectangle.png',
                        height: 100.0,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Chicken Tikka',
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // height: 2.0,
                            color: Colors.black),
                      ),
                      // Text(
                      //   'Chicken marinated in\n spices & roasted in the clay oven..',
                      //   style: SafeGoogleFont('Poppins',
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //       //  height: 2.0,
                      //       color: Colors.black),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )));

    // ListView(
    //   children: const <Widget>[
    //     HomeViewAppBar(),
    //     HomeViewSearchBar(),
    //     FirstAdBannerSection(),
    //     CategorySection(),
    //   ],
    // );
  }
}
