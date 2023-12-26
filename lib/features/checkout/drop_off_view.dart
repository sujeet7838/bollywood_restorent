import 'dart:convert';
import 'package:bollybood_restorent/Api/api_provider.dart';

import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DropOffScreen extends StatefulWidget {
  const DropOffScreen({super.key});

  @override
  State<DropOffScreen> createState() => _DropOffScreenState();
}

class _DropOffScreenState extends State<DropOffScreen>
    with SingleTickerProviderStateMixin {
  final bool isSelected = false;

  String dropdownvalue = 'Bollywood Hastings';
  var items = [
    'Bollywood Hastings',
    'Bollywood Napier',
    'Bollywood Gisborne',
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    getUserData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  var response;
  var cartData;
  var getUserId;
  var totalprice;
  int _itemCount = 1;
  // @override
  // void initState() {
  //   getUserData();
  //   super.initState();
  // }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getUserId = sharedPreferences.getString("userID");
    getCardList(getUserId);
  }

  // final bool isSelected = false;
  getCardList(getUserId) async {
    try {
      response = await http.post(Uri.parse(ApiProvider.cartList), body: {
        'user_id': getUserId,
      });
      if (response.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(response.body);
          String userMessage = jsonData['message'];
          //print(userMessage);
          cartData = jsonData['data'];
          print(cartData);

          setState(() {
            totalprice = jsonData['total_price'];
          });
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
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.grey),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      "Drop off",
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
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Card(
                      color: const Color(0xFFF1F1F1),
                      elevation: 0,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
                          child: Image.asset(
                            "assets/mapicon.png",
                            scale: 1,
                          ),
                        ),
                        title: Text(
                          'Bollywood Hastings',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            height: 1.1725,
                            color: const Color(0xff282828),
                          ),
                        ),
                        subtitle: Text(
                          ' 4 Thackeray st, Napier South',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.1725,
                            color: const Color(0xff282828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
              ),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TabBar(
                          // indicator: BoxDecoration(
                          //   shape: BoxShape.rectangle,
                          //   borderRadius: BorderRadius.circular(
                          //     10.0,
                          //   ),
                          //   color: const Color(0xffF26122),
                          // ),
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 5.0),
                              insets: EdgeInsets.symmetric(horizontal: 16.0)),
                          labelColor: const Color(0xffF26122),
                          unselectedLabelColor: const Color(0xffF26122),
                          tabs: [
                            Tab(
                                child: Text(
                              'Asap',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 15 * fem,
                                fontWeight: FontWeight.w500,
                                height: 2.5,
                                color: const Color(0xff000000),
                              ),
                            )),
                            Tab(
                              child: Text(
                                'Later',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 15 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 2.5,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Open Now ',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 15 * fem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.5,
                                          color: const Color(0xffF26122),
                                        ),
                                      ),
                                      Text(
                                        'close 09:30 PM',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 15 * fem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.5,
                                          color: const Color(0xffAFAFAF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Order Summery',
                                      textAlign: TextAlign.start,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 15 * fem,
                                        fontWeight: FontWeight.w400,
                                        height: 2.5,
                                        color: const Color(0xffF26122),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Second Tab method
                              // const Column(
                              //   children: <Widget>[
                              //     Text(
                              //       'Development in progress',
                              //       style: TextStyle(fontSize: 24),
                              //     ),
                              //     SizedBox(height: 26),
                              //   ],
                              // )
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Open Now ',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 15 * fem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.5,
                                          color: const Color(0xffF26122),
                                        ),
                                      ),
                                      Text(
                                        'close 09:30 PM',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 15 * fem,
                                          fontWeight: FontWeight.w400,
                                          height: 2.5,
                                          color: const Color(0xffAFAFAF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Order Summery',
                                      textAlign: TextAlign.start,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 15 * fem,
                                        fontWeight: FontWeight.w400,
                                        height: 2.5,
                                        color: const Color(0xffF26122),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //     width: double.infinity,
                                  //     height: 200 * ffem,
                                  //     child: Container(
                                  //         child: cartData == null
                                  //             ? const Center(
                                  //                 child: Text(
                                  //                   "Cart empty!",
                                  //                   style:
                                  //                       TextStyle(fontSize: 20),
                                  //                 ),
                                  //               )
                                  //             : ListView.builder(
                                  //                 itemCount: cartData.length,
                                  //                 scrollDirection:
                                  //                     Axis.vertical,
                                  //                 itemBuilder:
                                  //                     (BuildContext context,
                                  //                         int index) {
                                  //                   var cartdataType =
                                  //                       cartData[index];
                                  //                   return Container(
                                  //                     width: double.infinity,
                                  //                     height: 55 * ffem,
                                  //                     margin:
                                  //                         const EdgeInsets.only(
                                  //                             left: 20,
                                  //                             right: 20,
                                  //                             top: 5),
                                  //                     decoration: const BoxDecoration(
                                  //                         color:
                                  //                             Color(0xffF6F6F6),
                                  //                         borderRadius:
                                  //                             BorderRadius.all(
                                  //                                 Radius
                                  //                                     .circular(
                                  //                                         15))),
                                  //                     child: Row(
                                  //                       children: <Widget>[
                                  //                         Container(
                                  //                           width: 45,
                                  //                           height: 45,
                                  //                           // margin:
                                  //                           //     const EdgeInsets
                                  //                           //         .all(8),
                                  //                           // decoration: BoxDecoration(
                                  //                           //     border: Border.all(
                                  //                           //         color: Colors
                                  //                           //             .grey,
                                  //                           //         width: 1),
                                  //                           //     borderRadius:
                                  //                           //         const BorderRadius
                                  //                           //             .all(
                                  //                           //             Radius.circular(
                                  //                           //                 10))),
                                  //                           child: Image(
                                  //                             image:
                                  //                                 NetworkImage(
                                  //                               '${ApiProvider.Image_URL}${cartdataType["product_image"]}',
                                  //                             ),
                                  //                             fit: BoxFit.cover,
                                  //                             //height: 20.0,
                                  //                           ),
                                  //                         ),
                                  //                         Expanded(
                                  //                           child: Column(
                                  //                             crossAxisAlignment:
                                  //                                 CrossAxisAlignment
                                  //                                     .start,
                                  //                             children: <Widget>[
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .only(
                                  //                                         left:
                                  //                                             10,
                                  //                                         right:
                                  //                                             7,
                                  //                                         top:
                                  //                                             2),
                                  //                                 child: Row(
                                  //                                   mainAxisAlignment:
                                  //                                       MainAxisAlignment
                                  //                                           .spaceBetween,
                                  //                                   children: <Widget>[
                                  //                                     Text(
                                  //                                         //'Plain Pappadom',
                                  //                                         '${cartdataType["product_name"]}',
                                  //                                         style: const TextStyle(
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.bold)),
                                  //                                     Text(
                                  //                                         //'\$2.00',
                                  //                                         '\$${cartdataType["unit_price"]}',
                                  //                                         style: const TextStyle(
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             color: Color(0xFF039789))),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .only(
                                  //                                         left:
                                  //                                             10,
                                  //                                         right:
                                  //                                             7,
                                  //                                         top:
                                  //                                             0),
                                  //                                 child: Row(
                                  //                                   // mainAxisAlignment:
                                  //                                   //     MainAxisAlignment
                                  //                                   //         .spaceBetween,
                                  //                                   children: <Widget>[
                                  //                                     const Text(
                                  //                                         'Item:',
                                  //                                         style: TextStyle(
                                  //                                             fontSize: 12,
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             color: Color(0xFF595959))),
                                  //                                     Text(
                                  //                                         '${cartdataType["quantity"]}',
                                  //                                         style: const TextStyle(
                                  //                                             fontSize: 10,
                                  //                                             fontWeight: FontWeight.bold,
                                  //                                             color: Color(0xFF039789))),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       ],
                                  //                     ),
                                  //                   );
                                  //                 },
                                  //               ))),
                                  cartData == null
                                      ? const Center(
                                          child: Text(
                                            "",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        )
                                      : Container(
                                          height: 110 * ffem,
                                          //width: Get.width / 1.1,
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 10, right: 10),

                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border:
                                                Border.all(color: Colors.white),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 2.0,
                                                spreadRadius: 0.0,
                                                offset: Offset(2.0,
                                                    2.0), // shadow direction: bottom right
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 7, top: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    const Text('Subtotal :',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF000000))),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          '\$00.00',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 11 * fem,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.1725 *
                                                                fem /
                                                                fem,
                                                            color: const Color(
                                                                0xff595959),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 7, top: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Delivery cost :',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF000000))),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          '\$00.00',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 11 * fem,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            height: 1.1725 *
                                                                fem /
                                                                fem,
                                                            color: const Color(
                                                                0xff595959),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // const Divider(
                                              //   color: Colors.grey,
                                              //   height: 0.1,
                                              // ),
                                              // const SizedBox(
                                              //   height: 10,
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 7, top: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    const Text('Discount :',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF000000))),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          '\$0.0',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 11 * fem,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            height: 1.1725 *
                                                                fem /
                                                                fem,
                                                            color: const Color(
                                                                0xff595959),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 7, top: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    const Text('Amount Total :',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF000000))),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          '\$$totalprice',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16 * fem,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            height: 1.1725 *
                                                                fem /
                                                                fem,
                                                            color: const Color(
                                                                0xff039789),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Container(
                                              //   width: double.infinity,
                                              //   padding: const EdgeInsets.only(
                                              //       left: 32.0,
                                              //       right: 32.0,
                                              //       top: 25),
                                              //   child: Column(
                                              //     mainAxisAlignment:
                                              //         MainAxisAlignment.center,
                                              //     children: <Widget>[
                                              //       GestureDetector(
                                              //         onTap: () {
                                              //           // Get.to(
                                              //           //     () =>
                                              //           //         const CheckoutScreen(),
                                              //           //     transition:
                                              //           //         Transition
                                              //           //             .fadeIn);
                                              //         },
                                              //         child: Container(
                                              //           //width: 315 * fem,
                                              //           height: 40 * fem,
                                              //           decoration:
                                              //               BoxDecoration(
                                              //             color: const Color(
                                              //                 0xfff26122),
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(
                                              //                         20 * fem),
                                              //           ),
                                              //           child: Center(
                                              //             child: Text(
                                              //               'Continue',
                                              //               style: GoogleFonts
                                              //                   .roboto(
                                              //                 fontSize:
                                              //                     15 * fem,
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .w500,
                                              //                 height: 1.1725 *
                                              //                     fem /
                                              //                     fem,
                                              //                 color: const Color(
                                              //                     0xffffffff),
                                              //               ),
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
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 32.0, right: 32.0, top: 25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            // Get.to(
                                            //     () =>
                                            //         const CheckoutScreen(),
                                            //     transition:
                                            //         Transition
                                            //             .fadeIn);
                                          },
                                          child: Container(
                                            //width: 315 * fem,
                                            height: 40 * fem,
                                            decoration: BoxDecoration(
                                              color: const Color(0xfff26122),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20 * fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Continue',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 15 * fem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.1725 * fem / fem,
                                                  color:
                                                      const Color(0xffffffff),
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
                            ],
                          ),
                        )
                      ]),
                ),
              ))
        ],
      )),
    );
  }
}
