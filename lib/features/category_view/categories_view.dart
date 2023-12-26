import 'dart:convert';
import 'package:bollybood_restorent/Api/SnackbarUtils.dart';
import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/Api/model/categoryListModel.dart';
import 'package:bollybood_restorent/Api/model/selectLocationModel.dart';
import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesView extends StatefulWidget {
  CategoriesView({super.key, required this.id});
  final String id;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final bool isSelected = false;
  var getLocationTypeData;
  var resLocation;
  var getUserId;

  String dropdownvalue1 = 'Mild';
  var items1 = [
    'Mild',
    'Medium',
    'Hot',
  ];
  String dropdownvalue2 = 'Mild';
  var items2 = [
    'Mild',
    'Medium',
    'Hot',
  ];

  var response, catResp, catDataResp, comboResp;
  var getCategoryTypeData, CategoryData, CateStaterData, comboData, comboPrice;
  var comboType;
  @override
  void initState() {
    getUserData();
    getCategoryListData();
    categoryWiseMenu();
    // getLocationComboMenu();
    getLocationData();

    super.initState();
    //print("IDDDDDDDDD" + widget.id.toString());
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getUserId = sharedPreferences.getString("userID");
  }

  var dropdownvalue;
  List<dynamic> _dataLocation = [];
  void getLocationData() async {
    final resLocation = await http.get(Uri.parse(ApiProvider.StoreLocation));
    var listData = jsonDecode(resLocation.body);
    setState(() {
      _dataLocation = listData;
    });
    // print("data : $listData");
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

  // var dropdownVari;
  // List<dynamic> _dataLocationVari = [];
  var dropdownvaluecat;
  List<dynamic> _dataLocation1 = [];
  categoryWiseMenu() async {
    try {
      catResp = await http.post(Uri.parse(ApiProvider.categoryWiseMenu), body: {
        'store_id': widget.id,
      });
      //print("catResp???????" + catResp.statusCode.toString());
      if (catResp.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(catResp.body.toString());
          catDataResp = jsonData['data'];
          //print("catDataResp???????" + catDataResp.toString());
          CategoryData = jsonData['data']['Main_Course'] as List<dynamic>;
          // print('_dataLocationVari???? ' +
          //     CategoryData[0]['product_variation'].toString());
          // setState(() {
          //   _dataLocation1 =
          //       jsonData['data']['Main_Course']['product_variation'];
          //   print("_dataLocation" + _dataLocation1.toString());
          // });
          // setState(() {
          //   _dataLocationVari =
          //       jsonData['data']['Main_Course']['product_variation'];
          // });
          // print("_dataLocationVari???? : $_dataLocationVari");
          CateStaterData = jsonData['data']['Starter'] as List<dynamic>;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  // getLocationComboMenu() async {
  //   try {
  //     comboResp =
  //         await http.post(Uri.parse(ApiProvider.locationComboMenu), body: {
  //       'store_id': widget.id,
  //     });
  //     print("comboResp???????" + comboResp.statusCode.toString());
  //     if (comboResp.statusCode == 200) {
  //       setState(() {
  //         final jsonData = jsonDecode(comboResp.body.toString());
  //         comboData = jsonData['data'].toString();
  //         //print("comboData???????" + comboData.toString());
  //         comboType = jsonData['data']['Lunch_Combo']['details'];
  //         print("comboType???????" + comboType.toString());
  //         // comboPrice =
  //         //     jsonData['data']['Lunch_Combo']['price'] as List<dynamic>;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
                        hint: Text(
                          "Select Location",
                          style: GoogleFonts.roboto(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 1.1725,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                        underline: const SizedBox(),
                        dropdownColor: const Color(0xffF26122),
                        borderRadius: BorderRadius.circular(20),
                        value: dropdownvalue,
                        icon: Image.asset(
                          "assets/arrow_down.png",
                          scale: 1,
                        ),
                        items: _dataLocation.map((items) {
                          return DropdownMenuItem(
                            value: items['id'],
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/marker.png",
                                  scale: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    items['name'],
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
                        onChanged: (newValue) {
                          // categoryWiseMenu(newValue);
                          setState(() {
                            dropdownvalue = newValue;
                            print(dropdownvalue);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                "Category",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 16 * fem,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: const Color(0xffF26122),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Center(
          //     child: Text(
          //   "Category",
          //   style: SafeGoogleFont(
          //     'Poppins',
          //     fontSize: 15 * fem,
          //     fontWeight: FontWeight.w400,
          //     height: 1.5,
          //     color: const Color(0xffF26122),
          //   ),
          // )),
          // const SizedBox(
          //   height: 15,
          // ),
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
                        return GestureDetector(
                          onTap: () {},
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
                    // comboType != ''
                    //     ? const Text(
                    //         'Combo(1)',
                    //         // comboType + "(1)",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 14,
                    //           color: Color(0xFF000000),
                    //         ),
                    //       )
                    //     :
                    Text(
                      'Lunch Combo(1)',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //     width: double.infinity,
          //     height: 250 * ffem,
          //     child: Container(
          //         child: Column(
          //       children: [
          //         catDataResp == ''
          //             ? const Center(
          //                 child: Text(
          //                   "No Data",
          //                   style: TextStyle(fontSize: 20),
          //                 ),
          //               )
          //             : ListView.builder(
          //                 itemCount: comboType.length,
          //                 scrollDirection: Axis.vertical,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   var comboTypedata = comboType[index];

          //                   return Column(
          //                     children: [
          //                       Container(
          //                         width: double.infinity,
          //                         // height: 85 * ffem,
          //                         margin: const EdgeInsets.only(
          //                             left: 20, right: 20, top: 5),
          //                         decoration: BoxDecoration(
          //                             // color: Color(0xffF6F6F6),
          //                             border: Border.all(
          //                                 color: const Color(0xFF039789),
          //                                 width: 1),
          //                             borderRadius: const BorderRadius.all(
          //                                 Radius.circular(15))),
          //                         child: Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Row(
          //                               children: <Widget>[
          //                                 Container(
          //                                   width: 65,
          //                                   height: 65,
          //                                   margin: const EdgeInsets.all(8),
          //                                   decoration: BoxDecoration(
          //                                       border: Border.all(
          //                                           color: Colors.grey,
          //                                           width: 1),
          //                                       borderRadius:
          //                                           const BorderRadius.all(
          //                                               Radius.circular(10))),
          //                                   child: Image(
          //                                     image: NetworkImage(
          //                                       '${ApiProvider.Image_URL}${comboTypedata["product_image"]}',
          //                                     ),
          //                                     fit: BoxFit.cover,
          //                                     height: 30.0,
          //                                   ),
          //                                 ),
          //                                 Expanded(
          //                                   child: Column(
          //                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: <Widget>[
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 left: 10, right: 7),
          //                                         child: Row(
          //                                           mainAxisAlignment:
          //                                               MainAxisAlignment
          //                                                   .spaceBetween,
          //                                           children: <Widget>[
          //                                             Text(
          //                                                 '${comboTypedata["product_name"]}',
          //                                                 style: const TextStyle(
          //                                                     fontSize: 12,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .bold)),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 right: 4, left: 10),
          //                                         child: Expanded(
          //                                           child: Text(
          //                                             'Sliced vegetables dipped in mildly spiced and fried Sliced vegetables dipped in mildly spiced and fried',
          //                                             maxLines: 2,
          //                                             overflow:
          //                                                 TextOverflow.ellipsis,
          //                                             style: SafeGoogleFont(
          //                                                 'Poppins',
          //                                                 fontSize: 8,
          //                                                 fontStyle:
          //                                                     FontStyle.normal,
          //                                                 fontWeight:
          //                                                     FontWeight.w500,
          //                                                 // height: 2.0,
          //                                                 color: Colors.black),
          //                                           ),
          //                                         ),
          //                                       ),
          //                                       Padding(
          //                                         padding:
          //                                             const EdgeInsets.only(
          //                                                 left: 10,
          //                                                 right: 7,
          //                                                 top: 5),
          //                                         child: Row(
          //                                           mainAxisAlignment:
          //                                               MainAxisAlignment
          //                                                   .spaceBetween,
          //                                           children: <Widget>[
          //                                             Text(
          //                                                 '\$${comboTypedata["product_price"]}',
          //                                                 style: const TextStyle(
          //                                                     fontSize: 12,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .bold,
          //                                                     color: Color(
          //                                                         0xFF039789))),
          //                                             GestureDetector(
          //                                               onTap: () {
          //                                                 print(
          //                                                     '${comboTypedata["product_id"]}');
          //                                                 addToCart(
          //                                                     comboTypedata[
          //                                                         "product_id"],
          //                                                     comboTypedata[
          //                                                         "product_price"]);
          //                                               },
          //                                               child: Container(
          //                                                 width: 50 * fem,
          //                                                 height: 18 * fem,
          //                                                 decoration:
          //                                                     BoxDecoration(
          //                                                   color: const Color(
          //                                                       0xfff26122),
          //                                                   borderRadius:
          //                                                       BorderRadius
          //                                                           .circular(
          //                                                               20 *
          //                                                                   fem),
          //                                                 ),
          //                                                 child: Center(
          //                                                   child: Text(
          //                                                     '+ ADD',
          //                                                     style: GoogleFonts
          //                                                         .poppins(
          //                                                       fontSize:
          //                                                           11 * fem,
          //                                                       fontWeight:
          //                                                           FontWeight
          //                                                               .w500,
          //                                                       height: 1.1725 *
          //                                                           fem /
          //                                                           fem,
          //                                                       color: const Color(
          //                                                           0xffffffff),
          //                                                     ),
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             )
          //                                           ],
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             const Padding(
          //                               padding: EdgeInsets.all(2.0),
          //                               child: Text(
          //                                   "Select your choice to continue",
          //                                   style: TextStyle(
          //                                       fontSize: 12,
          //                                       fontWeight: FontWeight.bold)),
          //                             ),
          //                             Container(
          //                                 width: double.infinity,
          //                                 height: 100 * ffem,
          //                                 child: comboTypedata == ''
          //                                     ? const Center(
          //                                         child: Text(
          //                                           "No Data",
          //                                           style:
          //                                               TextStyle(fontSize: 20),
          //                                         ),
          //                                       )
          //                                     : ListView.builder(
          //                                         itemCount: comboTypedata[
          //                                                 'product_variation']
          //                                             .length,
          //                                         scrollDirection:
          //                                             Axis.vertical,
          //                                         itemBuilder:
          //                                             (context, index) {
          //                                           return Container(
          //                                             height: 30 * fem,
          //                                             margin:
          //                                                 const EdgeInsets.only(
          //                                                     bottom: 5,
          //                                                     left: 5,
          //                                                     right: 5),
          //                                             padding: const EdgeInsets
          //                                                 .symmetric(
          //                                                 horizontal: 25),
          //                                             decoration: BoxDecoration(
          //                                               border: Border.all(
          //                                                   color: const Color(
          //                                                       0xFF039789)),
          //                                               borderRadius:
          //                                                   BorderRadius
          //                                                       .circular(5),
          //                                             ),
          //                                             child: Padding(
          //                                               padding:
          //                                                   const EdgeInsets
          //                                                       .only(
          //                                                       left: 10,
          //                                                       right: 7,
          //                                                       top: 0),
          //                                               child: Row(
          //                                                 mainAxisAlignment:
          //                                                     MainAxisAlignment
          //                                                         .spaceBetween,
          //                                                 children: <Widget>[
          //                                                   Text(
          //                                                       '${comboTypedata['product_variation'][index]['variation_value_name']}',
          //                                                       style: const TextStyle(
          //                                                           fontSize:
          //                                                               12,
          //                                                           fontWeight:
          //                                                               FontWeight
          //                                                                   .bold,
          //                                                           color: Color(
          //                                                               0xFF039789))),
          //                                                   GestureDetector(
          //                                                     onTap: () {
          //                                                       // addToCart(
          //                                                       //     categoryTypedata[
          //                                                       //         "product_id"],
          //                                                       //     categoryTypedata[
          //                                                       //         "product_price"]);
          //                                                     },
          //                                                     child: Center(
          //                                                       child:
          //                                                           Image.asset(
          //                                                         "assets/arrow_down.png",
          //                                                         scale: 1,
          //                                                       ),
          //                                                     ),
          //                                                   )
          //                                                 ],
          //                                               ),
          //                                             ),
          //                                           );
          //                                         },
          //                                       ))
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   );
          //                 },
          //               ),
          //       ],
          //     ))),
          // Container(
          //     width: double.infinity,
          //     height: 185 * ffem,
          //     margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
          //     decoration: const BoxDecoration(
          //         color: Color(0xffF6F6F6),
          //         borderRadius: BorderRadius.all(Radius.circular(5))),
          //     child: comboResp != null
          //         ? ListView.builder(
          //             itemCount: comboData['details'].length,
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: 0.0,
          //             ),
          //             scrollDirection: Axis.vertical,
          //             itemBuilder: (context, index) {
          //               return Container(
          //                 //height: 75,
          //                 margin: const EdgeInsets.symmetric(
          //                     vertical: 5, horizontal: 5),
          //                 child: Row(
          //                   children: <Widget>[
          //                     Container(
          //                       width: 65,
          //                       height: 65,
          //                       decoration: BoxDecoration(
          //                           border: Border.all(
          //                               color: Colors.grey, width: 1),
          //                           borderRadius: const BorderRadius.all(
          //                               Radius.circular(10))),
          //                       child: Image(
          //                         image: NetworkImage(
          //                           '${ApiProvider.Image_URL}${comboData['details'][index]['product_image']}',
          //                         ),
          //                         fit: BoxFit.cover,
          //                         height: 30.0,
          //                       ),
          //                     ),
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: <Widget>[
          //                           Padding(
          //                             padding:
          //                                 EdgeInsets.only(left: 10, right: 7),
          //                             child: Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.spaceBetween,
          //                               children: <Widget>[
          //                                 Text(
          //                                     '${comboData['details'][index]['product_name']}',
          //                                     style: const TextStyle(
          //                                         fontSize: 12,
          //                                         fontWeight: FontWeight.bold)),
          //                               ],
          //                             ),
          //                           ),
          //                           const Padding(
          //                             padding:
          //                                 EdgeInsets.only(right: 4, left: 10),
          //                             child: Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.start,
          //                               children: <Widget>[
          //                                 Expanded(
          //                                   child: Row(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.start,
          //                                     children: <Widget>[
          //                                       Icon(
          //                                         Icons.arrow_forward_ios,
          //                                         size: 8,
          //                                         color: Colors.grey,
          //                                       ),
          //                                       Icon(
          //                                         Icons.arrow_forward_ios,
          //                                         size: 8,
          //                                         color: Colors.grey,
          //                                       ),
          //                                       Text(
          //                                         '1x Curry',
          //                                         style:
          //                                             TextStyle(fontSize: 10),
          //                                       ),
          //                                       Padding(
          //                                         padding:
          //                                             EdgeInsets.only(left: 25),
          //                                         child: Row(
          //                                           mainAxisAlignment:
          //                                               MainAxisAlignment.end,
          //                                           children: [
          //                                             Icon(
          //                                               Icons.arrow_forward_ios,
          //                                               size: 8,
          //                                               color: Colors.grey,
          //                                             ),
          //                                             Icon(
          //                                               Icons.arrow_forward_ios,
          //                                               size: 8,
          //                                               color: Colors.grey,
          //                                             ),
          //                                             Text(
          //                                               '1x Plain Rice',
          //                                               style: TextStyle(
          //                                                   fontSize: 10),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       )
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                           const Padding(
          //                             padding:
          //                                 EdgeInsets.only(right: 4, left: 10),
          //                             child: Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.start,
          //                               children: <Widget>[
          //                                 Expanded(
          //                                   child: Row(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.start,
          //                                     children: <Widget>[
          //                                       Icon(
          //                                         Icons.arrow_forward_ios,
          //                                         size: 8,
          //                                         color: Colors.grey,
          //                                       ),
          //                                       Icon(
          //                                         Icons.arrow_forward_ios,
          //                                         size: 8,
          //                                         color: Colors.grey,
          //                                       ),
          //                                       Text(
          //                                         '1x Rice',
          //                                         style:
          //                                             TextStyle(fontSize: 10),
          //                                       ),
          //                                       Padding(
          //                                         padding:
          //                                             EdgeInsets.only(left: 25),
          //                                         child: Row(
          //                                           mainAxisAlignment:
          //                                               MainAxisAlignment.end,
          //                                           children: [
          //                                             Icon(
          //                                               Icons.arrow_forward_ios,
          //                                               size: 8,
          //                                               color: Colors.grey,
          //                                             ),
          //                                             Icon(
          //                                               Icons.arrow_forward_ios,
          //                                               size: 8,
          //                                               color: Colors.grey,
          //                                             ),
          //                                             Text(
          //                                               '1x Can Drink',
          //                                               style: TextStyle(
          //                                                   fontSize: 10),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       )
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                           Padding(
          //                             padding: const EdgeInsets.only(
          //                                 left: 10, right: 7),
          //                             child: Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.spaceBetween,
          //                               children: <Widget>[
          //                                 Text('\$${comboData['price']}',
          //                                     style: const TextStyle(
          //                                         fontSize: 12,
          //                                         fontWeight: FontWeight.bold,
          //                                         color: Color(0xFF039789))),
          //                                 comboData['Lunch_Combo']['details']
          //                                                 [index]
          //                                             ['product_description'] ==
          //                                         ''
          //                                     ? GestureDetector(
          //                                         onTap: () {
          //                                           // print("getId????" +
          //                                           //     '${comboData["Lunch_Combo"]['id']}');
          //                                           addToCart(
          //                                               comboData["Lunch_Combo"]
          //                                                   ['id'],
          //                                               comboData["Lunch_Combo"]
          //                                                   ['price']);
          //                                         },
          //                                         child: Container(
          //                                           width: 50 * fem,
          //                                           height: 18 * fem,
          //                                           decoration: BoxDecoration(
          //                                             color: const Color(
          //                                                 0xfff26122),
          //                                             borderRadius:
          //                                                 BorderRadius.circular(
          //                                                     20 * fem),
          //                                           ),
          //                                           child: Center(
          //                                             child: Text(
          //                                               '+ ADD',
          //                                               style:
          //                                                   GoogleFonts.roboto(
          //                                                 fontSize: 11 * fem,
          //                                                 fontWeight:
          //                                                     FontWeight.w500,
          //                                                 height: 1.1725 *
          //                                                     fem /
          //                                                     fem,
          //                                                 color: const Color(
          //                                                     0xffffffff),
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       )
          //                                     : Text(''),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             },
          //           )
          //         : const SizedBox(
          //             height: 60.0,
          //             child: Center(child: CircularProgressIndicator()),
          //           )),

          // Main List data

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
                      'Main Course(2)',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              height: 250 * ffem,
              child: Container(
                  child: CategoryData == null
                      ? const Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.builder(
                          itemCount: CategoryData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            var categoryTypedata = CategoryData[index];
                            // var variationType = CategoryData[index]
                            //         ['product_variation']
                            //     .length
                            //     .toString();
                            // print("Veriation" +
                            //     CategoryData[index]['product_variation']
                            //         .toString());
                            return Column(
                              children: [
                                // Padding(
                                //     padding: const EdgeInsets.only(
                                //       top: 10,
                                //       bottom: 5,
                                //       left: 8,
                                //       right: 8,
                                //     ),
                                //     child: Padding(
                                //       padding:
                                //           EdgeInsets.only(left: 10, right: 10),
                                //       //color: Colors.amber,
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Text(
                                //             'Main Course(${CategoryData.length})',
                                //             // '${categoryTypedata["category_name"].toString()}(${CategoryData.length})',
                                //             style: const TextStyle(
                                //               fontWeight: FontWeight.w500,
                                //               fontSize: 14,
                                //               color: Color(0xFF000000),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     )),
                                Container(
                                  width: double.infinity,
                                  // height: 85 * ffem,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  decoration: BoxDecoration(
                                      // color: Color(0xffF6F6F6),
                                      border: Border.all(
                                          color: const Color(0xFF039789),
                                          width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 65,
                                            height: 65,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Image(
                                              image: NetworkImage(
                                                '${ApiProvider.Image_URL}${categoryTypedata["product_image"]}',
                                              ),
                                              fit: BoxFit.cover,
                                              height: 30.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                          '${categoryTypedata["product_name"]}',
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4, left: 10),
                                                  child: Expanded(
                                                    child: Text(
                                                      'Sliced vegetables dipped in mildly spiced and fried Sliced vegetables dipped in mildly spiced and fried',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 8,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // height: 2.0,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 7,
                                                          top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                          '\$${categoryTypedata["product_price"]}',
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFF039789))),
                                                      GestureDetector(
                                                        onTap: () {
                                                          print(
                                                              '${categoryTypedata["product_id"]}');
                                                          addToCart(
                                                              categoryTypedata[
                                                                  "product_id"],
                                                              categoryTypedata[
                                                                  "product_price"]);
                                                        },
                                                        child: Container(
                                                          width: 50 * fem,
                                                          height: 18 * fem,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xfff26122),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20 *
                                                                            fem),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '+ ADD',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize:
                                                                    11 * fem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1.1725 *
                                                                    fem /
                                                                    fem,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const Padding(
                                      //   padding: EdgeInsets.all(2.0),
                                      //   child: Text(
                                      //       "Select your choice to continue",
                                      //       style: TextStyle(
                                      //           fontSize: 12,
                                      //           fontWeight: FontWeight.bold)),
                                      // ),
                                      // Container(
                                      //   height: 30 * fem,
                                      //   margin:
                                      //       const EdgeInsets.only(right: 20),
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 25),
                                      //   decoration: BoxDecoration(
                                      //     border:
                                      //         Border.all(color: Colors.grey),
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //   ),
                                      //   child: DropdownButton(
                                      //     hint: Text(
                                      //       "Select Location",
                                      //       style: GoogleFonts.roboto(
                                      //         fontSize: 11,
                                      //         fontWeight: FontWeight.w500,
                                      //         height: 1.1725,
                                      //         color: const Color(0xffFFFFFF),
                                      //       ),
                                      //     ),
                                      //     underline: const SizedBox(),
                                      //     dropdownColor:
                                      //         const Color(0xffF26122),
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //     value: dropdownvaluecat,
                                      //     icon: Image.asset(
                                      //       "assets/arrow_down.png",
                                      //       scale: 1,
                                      //     ),
                                      //     items: _dataLocation1.map((items) {
                                      //       return DropdownMenuItem(
                                      //         value:
                                      //             items['variation_value_id'],
                                      //         child: Row(
                                      //           children: [
                                      //             Image.asset(
                                      //               "assets/marker.png",
                                      //               scale: 1,
                                      //             ),
                                      //             Padding(
                                      //               padding:
                                      //                   const EdgeInsets.all(
                                      //                       8.0),
                                      //               child: Text(
                                      //                 items[
                                      //                     'variation_value_name'],
                                      //                 style: GoogleFonts.roboto(
                                      //                   fontSize: 11,
                                      //                   fontWeight:
                                      //                       FontWeight.w500,
                                      //                   height: 1.1725,
                                      //                   color: const Color(
                                      //                       0xffFFFFFF),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       );
                                      //     }).toList(),
                                      //     onChanged: (newValue) {
                                      //       // categoryWiseMenu(newValue);
                                      //       setState(() {
                                      //         dropdownvaluecat = newValue;
                                      //         print(dropdownvaluecat);
                                      //       });
                                      //     },
                                      //   ),
                                      // ),
                                      // Container(
                                      //     width: double.infinity,
                                      //     height: 100 * ffem,
                                      //     child: categoryTypedata == ''
                                      //         ? const Center(
                                      //             child: Text(
                                      //               "No Data",
                                      //               style:
                                      //                   TextStyle(fontSize: 20),
                                      //             ),
                                      //           )
                                      //         : ListView.builder(
                                      //             itemCount: categoryTypedata[
                                      //                     'product_variation']
                                      //                 .length,
                                      //             scrollDirection:
                                      //                 Axis.vertical,
                                      //             itemBuilder:
                                      //                 (context, index) {
                                      //               return Container(
                                      //                 height: 30 * fem,
                                      //                 margin:
                                      //                     const EdgeInsets.only(
                                      //                         bottom: 5,
                                      //                         left: 5,
                                      //                         right: 5),
                                      //                 padding: const EdgeInsets
                                      //                     .symmetric(
                                      //                     horizontal: 25),
                                      //                 decoration: BoxDecoration(
                                      //                   border: Border.all(
                                      //                       color: const Color(
                                      //                           0xFF039789)),
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(5),
                                      //                 ),
                                      //                 child: Padding(
                                      //                   padding:
                                      //                       const EdgeInsets
                                      //                           .only(
                                      //                           left: 10,
                                      //                           right: 7,
                                      //                           top: 0),
                                      //                   child: Row(
                                      //                     mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .spaceBetween,
                                      //                     children: <Widget>[
                                      //                       Text(
                                      //                           '${categoryTypedata['product_variation'][index]['variation_value_name']}',
                                      //                           style: const TextStyle(
                                      //                               fontSize:
                                      //                                   12,
                                      //                               fontWeight:
                                      //                                   FontWeight
                                      //                                       .bold,
                                      //                               color: Color(
                                      //                                   0xFF039789))),
                                      //                       GestureDetector(
                                      //                         onTap: () {
                                      //                           // addToCart(
                                      //                           //     categoryTypedata[
                                      //                           //         "product_id"],
                                      //                           //     categoryTypedata[
                                      //                           //         "product_price"]);
                                      //                         },
                                      //                         child: Center(
                                      //                           child:
                                      //                               Image.asset(
                                      //                             "assets/arrow_down.png",
                                      //                             scale: 1,
                                      //                           ),
                                      //                         ),
                                      //                       )
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               );
                                      //             },
                                      //           ))
                                      // Container(
                                      //         height: 30 * fem,
                                      //         margin: const EdgeInsets.only(
                                      //             bottom: 5, left: 5, right: 5),
                                      //         padding:
                                      //             const EdgeInsets.symmetric(
                                      //                 horizontal: 25),
                                      //         decoration: BoxDecoration(
                                      //           border: Border.all(
                                      //               color: const Color(
                                      //                   0xFF039789)),
                                      //           borderRadius:
                                      //               BorderRadius.circular(5),
                                      //         ),
                                      //         child: DropdownButton(
                                      //           isExpanded: true,
                                      //           underline: const SizedBox(),
                                      //           dropdownColor:
                                      //               const Color(0xffFFFFFF),
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //           value: dropdownvalue1,
                                      //           icon: Image.asset(
                                      //             "assets/arrow_down.png",
                                      //             scale: 1,
                                      //           ),
                                      //           items:
                                      //               items1.map((String items1) {
                                      //             return DropdownMenuItem(
                                      //               value: items1,
                                      //               child: Padding(
                                      //                 padding:
                                      //                     const EdgeInsets.only(
                                      //                         left: 5,
                                      //                         right: 15),
                                      //                 child: Text(
                                      //                   items1,
                                      //                   textAlign:
                                      //                       TextAlign.start,
                                      //                   style:
                                      //                       GoogleFonts.roboto(
                                      //                     fontSize: 12,
                                      //                     fontWeight:
                                      //                         FontWeight.w500,
                                      //                     height: 1.1725,
                                      //                     color: const Color(
                                      //                         0xff039789),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             );
                                      //           }).toList(),
                                      //           onChanged: (String? newValue1) {
                                      //             setState(() {
                                      //               dropdownvalue1 = newValue1!;
                                      //             });
                                      //           },
                                      //         ),
                                      //       )

                                      // Container(
                                      //   height: 30 * fem,
                                      //   margin: const EdgeInsets.only(
                                      //       bottom: 5, left: 5, right: 5),
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 25),
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //         color: const Color(0xFF039789)),
                                      //     borderRadius:
                                      //         BorderRadius.circular(5),
                                      //   ),
                                      //   child: DropdownButton(
                                      //     isExpanded: true,
                                      //     underline: const SizedBox(),
                                      //     dropdownColor:
                                      //         const Color(0xffFFFFFF),
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //     value: dropdownvalue2,
                                      //     icon: Image.asset(
                                      //       "assets/arrow_down.png",
                                      //       scale: 1,
                                      //     ),
                                      //     items: items2.map((String items2) {
                                      //       return DropdownMenuItem(
                                      //         value: items2,
                                      //         child: Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               left: 5, right: 15),
                                      //           child: Text(
                                      //             items2,
                                      //             textAlign: TextAlign.start,
                                      //             style: GoogleFonts.roboto(
                                      //               fontSize: 12,
                                      //               fontWeight: FontWeight.w500,
                                      //               height: 1.1725,
                                      //               color:
                                      //                   const Color(0xff039789),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       );
                                      //     }).toList(),
                                      //     onChanged: (String? newValue2) {
                                      //       setState(() {
                                      //         dropdownvalue2 = newValue2!;
                                      //       });
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ))),

          //Stater menu data

          Container(
              width: double.infinity,
              height: 285 * ffem,
              child: Container(
                  child: CategoryData == null
                      ? const Center(
                          child: Text(
                            "",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.builder(
                          itemCount: CateStaterData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            var staterTypedata = CateStaterData[index];
                            return Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5,
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${staterTypedata["category_name"]}(${CateStaterData.length})',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  decoration: BoxDecoration(
                                      // color: Color(0xffF6F6F6),
                                      border: Border.all(
                                          color: const Color(0xFF039789),
                                          width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 65,
                                            height: 65,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Image(
                                              image: NetworkImage(
                                                '${ApiProvider.Image_URL}${staterTypedata["product_image"]}',
                                              ),
                                              fit: BoxFit.cover,
                                              height: 30.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 7),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                          '${staterTypedata["product_name"]}',
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4, left: 10),
                                                  child: Expanded(
                                                    child: Text(
                                                      'Sliced vegetables dipped in mildly spiced and fried Sliced vegetables dipped in mildly spiced and fried',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 8,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // height: 2.0,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 7,
                                                          top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                          '\$${staterTypedata["product_price"]}',
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xFF039789))),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 50 * fem,
                                                          height: 18 * fem,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFfff26122),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20 *
                                                                            fem),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '+ ADD',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize:
                                                                    11 * fem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1.1725 *
                                                                    fem /
                                                                    fem,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                            "Select your choice to continue",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          width: double.infinity,
                                          height: 100 * ffem,
                                          child: staterTypedata == ''
                                              ? const Center(
                                                  child: Text(
                                                    "No Data",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                )
                                              : ListView.builder(
                                                  itemCount: staterTypedata[
                                                          'product_variation']
                                                      .length,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      height: 30 * fem,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5,
                                                              left: 5,
                                                              right: 5),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 25),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFF039789)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 7,
                                                                top: 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                                '${staterTypedata['product_variation'][index]['variation_value_name']}',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xFF039789))),
                                                            GestureDetector(
                                                              onTap: () {
                                                                // addToCart(
                                                                //     categoryTypedata[
                                                                //         "product_id"],
                                                                //     categoryTypedata[
                                                                //         "product_price"]);
                                                              },
                                                              child: Center(
                                                                child:
                                                                    Image.asset(
                                                                  "assets/arrow_down.png",
                                                                  scale: 1,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ))
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ))),
        ],
      )),
    );
  }

  addToCart(productID, productPrice) async {
    try {
      var response = await http.post(Uri.parse(ApiProvider.addTocart), body: {
        'user_id': getUserId,
        'product_id': productID,
        'quantity': '1',
        'unit_price': productPrice,
        'combo_id': '0',
      }, headers: {
        "Access-Control_Allow_Origin": "*"
      });
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        String userMessage = responseBody['message'];
        print(userMessage);

        if (responseBody['status'] != 0) {
          SnackbarUtils.showFloatingSnackbar(
              "Product added to cart", userMessage);
        } else {
          SnackbarUtils.showFloatingSnackbar(
              "Product added to cart", userMessage);
        }
      } else {
        SnackbarUtils.showFloatingSnackbar(
            "Product added to cart", "Product added to cart Failed");
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {}
  }
}
