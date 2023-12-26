import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/Api/model/categoryListModel.dart';
import 'package:bollybood_restorent/Api/model/menuListModel.dart';
import 'package:bollybood_restorent/Api/model/selectLocationModel.dart';
import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/banner/first_ad_banner_section.dart';
import 'package:bollybood_restorent/features/MenuListAll/menuList_all.dart';
import 'package:bollybood_restorent/features/category_view/categories_view.dart';
import 'package:bollybood_restorent/features/category_view/categoryScreen.dart';
import 'package:bollybood_restorent/features/productScreen/productDetails.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class homeScreen extends StatefulWidget {
  const homeScreen({
    super.key,
  });

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // final bool isSelected = false;
  // String dropdownvalue = 'Bollywood Hastings';
  // var items = [
  //   'Bollywood Hastings',
  //   'Bollywood Napier',
  //   'Bollywood Gisborne',
  // ];

  var response, menuResp, aboutResp;
  var getCategoryTypeData, getMenuTypeData, getaboutTypeData;
  @override
  void initState() {
    super.initState();
    getCategoryListData();
    getMenuListData();
    getAboutData();
    getLocationData();
    // selectedItemId = -1; // Initialize with no item selected
    //fetchData();
  }

  // late List<SelectLocationModel> items1;
  // late int selectedItemId;

  // Future<void> fetchData() async {
  //   final resLocation = await http.get(Uri.parse(ApiProvider.StoreLocation));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     setState(() {
  //       items1 =
  //           data.map((item) => SelectLocationModel.fromJson(item)).toList();
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  var resLocation;
  var getLocationTypeData;
  Future<dynamic> getLocationData() async {
    try {
      resLocation = await http.get(Uri.parse(ApiProvider.StoreLocation));
      var LocationTypeResponceData = jsonDecode(resLocation.body.toString());
      if (resLocation.statusCode == 200) {
        getLocationTypeData = jsonDecode(resLocation.body);
        print(getLocationTypeData);

        return SelectLocationModel.fromJson(LocationTypeResponceData);
      } else {
        return SelectLocationModel.fromJson(LocationTypeResponceData);
      }
    } catch (e) {
      print(e);
    }
  }

  getCategoryListData() async {
    try {
      response = await http.get(Uri.parse(ApiProvider.CategoryList));
      var CategoryResponceData = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        setState(() {
          getCategoryTypeData = jsonDecode(response.body);
        });

        return CategoryListModel.fromJson(CategoryResponceData);
      } else {
        return CategoryListModel.fromJson(CategoryResponceData);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getMenuListData() async {
    try {
      menuResp = await http.get(Uri.parse(ApiProvider.MenuList));
      var MenuResponceData = jsonDecode(menuResp.body.toString());
      if (menuResp.statusCode == 200) {
        setState(() {
          getMenuTypeData = jsonDecode(menuResp.body);
        });

        return MenuListModel.fromJson(MenuResponceData);
      } else {
        return MenuListModel.fromJson(MenuResponceData);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getAboutData() async {
    try {
      aboutResp = await http.get(Uri.parse(ApiProvider.aboutData));
      // var aboutResponceData = jsonDecode(aboutResp.body.toString());
      if (aboutResp.statusCode == 200) {
        setState(() {
          getaboutTypeData = jsonDecode(aboutResp.body);
          print("object+xcbcb" + getaboutTypeData);
        });

        // return AboutModel.fromJson(aboutResponceData);
      }
      // else {
      //   return AboutModel.fromJson(aboutResponceData);
      // }
    } catch (e) {
      print(e);
    }
  }

  final List<String> _listViewData = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
  ];

  @override
  Widget build(BuildContext context) {
    // final MediaQueryData mediaQuery = MediaQuery.of(context);
    // final double screenWidth = mediaQuery.size.width;
    // final double screenHeight = mediaQuery.size.height;
    // final double fem = screenWidth / 375.0;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return

//     Scaffold(
//       backgroundColor: const Color(0xfff5f5f5),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: double.infinity,
//           height: screenHeight,
//           child: Column(children: [
//             Container(
//                 alignment: Alignment.centerRight,
//                 margin: EdgeInsets.only(
//                     top: 50 * fem, left: 20 * fem, right: 20 * fem),
//                 child: GestureDetector(
//                   onTap: () async {},
//                   child: const Icon(
//                     Icons.logout,
//                     size: 18,
//                     color: Color(0xff262525),
//                   ),
//                 )),
//             SizedBox(
//               height: 30 * fem,
//             ),
//             Text(
//               'Your Project',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.roboto(
//                 fontSize: 24 * fem,
//                 fontWeight: FontWeight.w500,
//                 height: 1.2000000477 * fem / fem,
//                 color: const Color(0xff282828),
//               ),
//             ),
//             SizedBox(
//               height: 15 * fem,
//             ),
//             Text(
//               'What’s something your team is currently working on?',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.roboto(
//                 fontSize: 14 * fem,
//                 fontWeight: FontWeight.w400,
//                 height: 1.2000000817 * fem / fem,
//                 color: const Color(0xff282828),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               onTap: () {
//                 //  _settingModalBottomSheet(context);
//               },
//               child: Container(
//                 width: 320 * fem,
//                 height: 46 * fem,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   color: const Color(0xff002a5a),
//                   borderRadius: BorderRadius.circular(6 * fem),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.add_circle_outline_sharp,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Add Project',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.roboto(
//                         fontSize: 18 * fem,
//                         fontWeight: FontWeight.w500,
//                         height: 1.1725 * fem / fem,
//                         color: const Color(0xffffffff),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }

//   _settingModalBottomSheet(
//     context,
//   ) {
//     showModalBottomSheet<dynamic>(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (BuildContext bc) {
//           int? selectedOption;

//           return Wrap(
//             children: <Widget>[
//               SingleChildScrollView(
//                 child: StatefulBuilder(
//                     builder: (BuildContext context, StateSetter setState) {
//                   return Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.width,
//                       decoration: const BoxDecoration(
//                         // color: colorPrimary,
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(18.0),
//                           topRight: Radius.circular(18.0),
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             title: const Text('Option 1'),
//                             leading: Radio<int>(
//                               value: 1,
//                               groupValue: selectedOption,
//                               onChanged: (int? value) {
//                                 setState(() {
//                                   selectedOption = value;
//                                   print("Selected Option: $selectedOption");
//                                 });
//                               },
//                             ),
//                           ),
//                           ListTile(
//                             title: const Text('Option 2'),
//                             leading: Radio<int>(
//                               value: 2,
//                               groupValue: selectedOption,
//                               onChanged: (int? value) {
//                                 setState(() {
//                                   selectedOption = value;
//                                   print("Selected Option: $selectedOption");
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ));
//                 }),
//               )
//             ],
//           );
//         });
//   }
// }

        Scaffold(
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
                    // Container(
                    //   height: 30 * fem,
                    //   margin: const EdgeInsets.only(right: 20),
                    //   padding: const EdgeInsets.symmetric(horizontal: 25),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: DropdownButton(
                    //     underline: const SizedBox(),
                    //     dropdownColor: const Color(0xffF26122),
                    //     borderRadius: BorderRadius.circular(20),
                    //     value: dropdownvalue,
                    //     icon: Image.asset(
                    //       "assets/arrow_down.png",
                    //       scale: 1,
                    //     ),
                    //     items: items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Row(
                    //           children: [
                    //             Image.asset(
                    //               "assets/marker.png",
                    //               scale: 1,
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Text(
                    //                 items,
                    //                 style: GoogleFonts.roboto(
                    //                   fontSize: 11,
                    //                   fontWeight: FontWeight.w500,
                    //                   height: 1.1725,
                    //                   color: const Color(0xffFFFFFF),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropdownvalue = newValue!;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              )),
          const FirstAdBannerSection(),
          Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
                left: 8,
                right: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
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
                            // Get.to(() => const CategoryScreen(),
                            //     transition: Transition.fadeIn);
                          },
                          child: const Text(
                            'More',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: colorSkyeBlue,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 8,
                          color: colorSkyeBlue,
                        ),
                        const Icon(
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
              child: response != null
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: getCategoryTypeData.length,
                      itemBuilder: (context, index) {
                        var categoryType = getCategoryTypeData[index];
                        var isSelected;
                        return GestureDetector(
                          onTap: () {
                            //showMessageDialog(context);

                            // Get.to(() => const CategoryScreen(),
                            //     transition: Transition.fadeIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 80 * ffem,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: colorLightGoldenYellow,
                                borderRadius: BorderRadius.circular(16.0),
                                border: isSelected == true
                                    ? Border.all(
                                        color:
                                            colorGoldenYellow.withOpacity(0.5),
                                        width: 1.5,
                                      )
                                    : Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/combo-icon.png',
                                    height: 25.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      '${categoryType["name"]}',
                                      overflow: TextOverflow.fade,
                                      style: SafeGoogleFont('Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          //height: 2.0,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
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
          Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
                left: 8,
                right: 8,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.amber,
                child: GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: const Row(
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
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 150 * ffem,
              height: 180 * ffem,
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
              ),
              child: menuResp != null
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: getMenuTypeData.length,
                      itemBuilder: (context, index) {
                        var menuType = getMenuTypeData[index];
                        return GestureDetector(
                            onTap: () {
                              print(menuType["id"]);
                              Get.to(
                                  () => ProductDetailsScreen(
                                        id: menuType["id"],
                                      ),
                                  transition: Transition.fadeIn);
                            },
                            child: Container(
                              width: 150 * ffem,
                              //height: 180 * ffem,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Wrap(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: 250 * ffem,
                                            height: 80 * ffem,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${ApiProvider.Image_URL}${menuType["image"]}',
                                                      scale: 1),
                                                  fit: BoxFit.cover),
                                            )),
                                        ListTile(
                                          title: Text(
                                            textAlign: TextAlign.start,
                                            '${menuType["name"]}',
                                            style: SafeGoogleFont('Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                // height: 2.0,
                                                color: Colors.black),
                                          ),
                                          subtitle: Text(
                                              textAlign: TextAlign.start,
                                              '${menuType["description"]}',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: SafeGoogleFont('Poppins',
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  //height: 2.0,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            // Container(

                            );
                      },
                    )
                  : const SizedBox(
                      height: 60.0,
                      child: Center(child: CircularProgressIndicator()),
                    )),
          Container(
            width: double.infinity,
            height: 110 * ffem,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 25),
            decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 8,
                  right: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  //color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'About Bollywood',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: coloryellowDark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bollywood is the informal name given to the popular Mumbai-based Hindi language film industry in India. The name is Blend of Bombay, the old name of Mumbai and Hollywood, the center of the American film industry. years ago in 1999 we opened our doors for you in Whanganui.',
                        // getaboutTypeData.about.toString(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: SafeGoogleFont('Poppins',
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            // height: 2.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }

  _settingModalBottomSheet(
    context,
  ) {
    showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          int? selectedOption;
          final Size mediaQuery = MediaQuery.of(context).size;
          DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
          double baseWidth = 360;
          double fem = MediaQuery.of(context).size.width / baseWidth;
          double ffem = fem * 0.97;
          return Wrap(
            children: <Widget>[
              SingleChildScrollView(
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        // color: colorPrimary,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0),
                        ),
                      ),
                      child: Column(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[300],
                                  child: Image.asset(
                                    "assets/mapicon.png",
                                    scale: 1,
                                  ),
                                ),
                                title: const Text('Bollywood Hastings'),
                                trailing: Radio<int>(
                                  value: 1,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value;
                                      print("Selected Option: $selectedOption");
                                      Get.to(
                                          () => CategoriesView(
                                              id: selectedOption.toString()),
                                          transition: Transition.fadeIn);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[300],
                                  child: Image.asset(
                                    "assets/mapicon.png",
                                    scale: 1,
                                  ),
                                ),
                                title: const Text('Bollywood Napier'),
                                trailing: Radio<int>(
                                  value: 2,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value;
                                      print("Selected Option: $selectedOption");
                                      Get.to(
                                          () => CategoriesView(
                                              id: selectedOption.toString()),
                                          transition: Transition.fadeIn);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[300],
                                  child: Image.asset(
                                    "assets/mapicon.png",
                                    scale: 1,
                                  ),
                                ),
                                title: const Text('Bollywood Gisborne'),
                                trailing: Radio<int>(
                                  value: 3,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value;
                                      print("Selected Option: $selectedOption");
                                      Get.to(
                                          () => CategoriesView(
                                              id: selectedOption.toString()),
                                          transition: Transition.fadeIn);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 32.0, right: 32.0, top: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print(selectedOption);
                                    // Get.to(() => const SignInScreen(),
                                    //     transition: Transition.fadeIn);
                                  },
                                  child: Container(
                                    width: 315 * fem,
                                    height: 46 * fem,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff26122),
                                      borderRadius:
                                          BorderRadius.circular(20 * fem),
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
                      )
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     ListTile(
                      //       title: const Text('Option 1'),
                      //       leading: Radio<int>(
                      //         value: 1,
                      //         groupValue: selectedOption,
                      //         onChanged: (int? value) {
                      //           setState(() {
                      //             selectedOption = value;
                      //             print("Selected Option: $selectedOption");
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     ListTile(
                      //       title: const Text('Option 2'),
                      //       leading: Radio<int>(
                      //         value: 2,
                      //         groupValue: selectedOption,
                      //         onChanged: (int? value) {
                      //           setState(() {
                      //             selectedOption = value;
                      //             print("Selected Option: $selectedOption");
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // )
                      );
                }),
              )
            ],
          );
        });
  }

  // _settingModalBottomSheet(context) {
  //   final Size mediaQuery = MediaQuery.of(context).size;
  //   DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
  //   double baseWidth = 360;
  //   double fem = MediaQuery.of(context).size.width / baseWidth;
  //   double ffem = fem * 0.97;

  //   int selectedRadioTile = -1;

  //   setSelectedRadioTile(int val) {
  //     setState(() {
  //       selectedRadioTile = val;
  //     });
  //   }
  //   // int selectedRadio = -1;

  //   // List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Column(
  //           children: [
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             Center(
  //               child: Text(
  //                 'Location',
  //                 style: GoogleFonts.roboto(
  //                   fontSize: 24 * fem,
  //                   fontWeight: FontWeight.w500,
  //                   height: 1.1725 * fem / fem,
  //                   color: const Color(0xffF37138),
  //                 ),
  //               ),
  //             ),
  //             //  SizedBox(
  //             // height: 200 * fem,
  //             // child: items1 == null
  //             //     ? const CircularProgressIndicator() // Loading indicator
  //             //     : ListView.builder(
  //             //         itemCount: items1.length,
  //             //         itemBuilder: (context, index) {
  //             //           return ListTile(
  //             //             title: Text(items1[index].name),
  //             //             leading: Radio(
  //             //               value: items1[index].id,
  //             //               groupValue: selectedItemId,
  //             //               onChanged: (value) {
  //             //                 setState(() {
  //             //                   selectedItemId = value as int;
  //             //                 });
  //             //               },
  //             //             ),
  //             //           );
  //             //         },
  //             //       )),
  //             SizedBox(
  //                 height: 200 * fem,
  //                 child: resLocation != null
  //                     ? ListView.builder(
  //                         itemCount: getLocationTypeData.length,
  //                         itemBuilder: (context, index) {
  //                           var serviceType = getLocationTypeData[index];
  //                           return Padding(
  //                             padding:
  //                                 const EdgeInsets.only(left: 0.0, right: 0.0),
  //                             child: Card(
  //                                 color: const Color(0xFFF1F1F1),
  //                                 elevation: 0,
  //                                 child: ListTile(
  //                                   title: Text(
  //                                       getLocationTypeData[index]['name']),
  //                                   leading: Radio(
  //                                     value: index,
  //                                     groupValue: selectedRadioTile,
  //                                     onChanged: (val) {
  //                                       setSelectedRadioTile(val!);
  //                                     },
  //                                   ),
  //                                 )

  //                                 // RadioListTile<int>(
  //                                 //   title: Text(
  //                                 //     '${serviceType["name"]}',
  //                                 //   ),
  //                                 //   value: 1,
  //                                 //   groupValue: getLocationTypeData[index]
  //                                 //       ["id"],
  //                                 //   controlAffinity:
  //                                 //       ListTileControlAffinity.trailing,
  //                                 //   activeColor: const Color(0xFF039789),
  //                                 //   onChanged: (int? value) {
  //                                 //     setState(() {
  //                                 //       selectedOption = value;
  //                                 //       print(
  //                                 //           "Selected Option: $selectedOption");
  //                                 //     });
  //                                 //   },
  //                                 // ),

  //                                 //     ListTile(
  //                                 //   leading: CircleAvatar(
  //                                 //     radius: 20,
  //                                 //     backgroundColor: Colors.grey[300],
  //                                 //     child: Image.asset(
  //                                 //       "assets/mapicon.png",
  //                                 //       scale: 1,
  //                                 //     ),
  //                                 //   ),
  //                                 //   title: Text(
  //                                 //     '${serviceType["name"]}',
  //                                 //     textAlign: TextAlign.center,
  //                                 //     style: GoogleFonts.roboto(
  //                                 //       fontSize: 18,
  //                                 //       fontWeight: FontWeight.w500,
  //                                 //       height: 1.1725,
  //                                 //       color: const Color(0xff282828),
  //                                 //     ),
  //                                 //   ),
  //                                 //   trailing: const Icon(
  //                                 //     Icons.arrow_forward_ios_rounded,
  //                                 //     size: 15,
  //                                 //   ),
  //                                 // ),
  //                                 // ),
  //                                 ),
  //                           );
  //                         },
  //                       )
  //                     : const SizedBox(
  //                         height: 60.0,
  //                         child: Center(child: CircularProgressIndicator()),
  //                       )),
  //             Container(
  //               width: double.infinity,
  //               padding: const EdgeInsets.only(
  //                 left: 32.0,
  //                 right: 32.0,
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   GestureDetector(
  //                     onTap: () {
  //                       // Get.to(() => const SignInScreen(),
  //                       //     transition: Transition.fadeIn);
  //                     },
  //                     child: Container(
  //                       width: 315 * fem,
  //                       height: 46 * fem,
  //                       decoration: BoxDecoration(
  //                         color: const Color(0xfff26122),
  //                         borderRadius: BorderRadius.circular(20 * fem),
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           'Confirm Location',
  //                           style: GoogleFonts.roboto(
  //                             fontSize: 15 * fem,
  //                             fontWeight: FontWeight.w500,
  //                             height: 1.1725 * fem / fem,
  //                             color: const Color(0xffffffff),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
