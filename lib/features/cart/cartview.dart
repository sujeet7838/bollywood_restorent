import 'dart:convert';

import 'package:bollybood_restorent/Api/SnackbarUtils.dart';
import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/checkout/checkout_view.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final bool isSelected = false;

  String dropdownvalue = 'Bollywood Hastings';
  var items = [
    'Bollywood Hastings',
    'Bollywood Napier',
    'Bollywood Gisborne',
  ];

  var response;
  var cartData;
  var getUserId;
  var totalprice;
  int _itemCount = 1;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getUserId = sharedPreferences.getString("userID");
    getCardList(getUserId);
  }

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
            height: 80.0,
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
                      fit: BoxFit.cover,
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
          height: 15,
        ),
        Center(
            child: Text(
          "Cart",
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 15 * fem,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: const Color(0xffF26122),
          ),
        )),
        SizedBox(
            width: double.infinity,
            height: 300 * ffem,
            child: Container(
                child: cartData == null
                    ? const Center(
                        child: Text(
                          "Cart empty!",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartData.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          var cartdataType = cartData[index];
                          return Container(
                            width: double.infinity,
                            height: 85 * ffem,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 5),
                            decoration: const BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 65,
                                  height: 65,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Image(
                                    image: NetworkImage(
                                      '${ApiProvider.Image_URL}${cartdataType["product_image"]}',
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
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 7, top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                                //'Plain Pappadom',
                                                '${cartdataType["product_name"]}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            GestureDetector(
                                              onTap: () {
                                                print(cartdataType["cart_id"]);
                                                deleteCart(
                                                    cartdataType["cart_id"]);
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Color(0XFFF26122),
                                                size: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4, left: 10),
                                        child: Expanded(
                                          child: cartdataType[
                                                      "variation_value_name"] !=
                                                  ''
                                              ? Text(
                                                  //'Sliced vegetables dipped in mildly spiced and fried Sliced vegetables dipped in mildly spiced and fried',
                                                  '${cartdataType["variation_value_name"]}',
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
                                                )
                                              : Text(
                                                  "Sliced vegetables dipped in mildly spiced chickpea flour batter and deep fried",
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
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 7, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                                //'\$2.00',
                                                '\$${cartdataType["unit_price"]}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF039789))),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 25,
                                                  width: 80,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() =>
                                                                _itemCount--);

                                                            // int quantity =
                                                            //     cartdataType[
                                                            //         "quantity"];
                                                            // int price =
                                                            //     cartdataType[
                                                            //         "unit_price"];
                                                            // quantity--;
                                                            // int? newPrice =
                                                            //     price *
                                                            //         quantity;
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color: Color(
                                                                0XFFF26122),
                                                          )),
                                                      Text(
                                                          _itemCount.toString(),
                                                          //'${cartdataType["quantity"]}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() =>
                                                                _itemCount++);
                                                            // var quantity =
                                                            //     cartdataType[
                                                            //         "quantity"];
                                                            // print("quantity" +
                                                            //     quantity
                                                            //         .toString());
                                                            // int price =
                                                            //     cartdataType[
                                                            //         "unit_price"];
                                                            // quantity++;
                                                            // int? newPrice =
                                                            //     price *
                                                            //         quantity;
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            color: Color(
                                                                0XFFF26122),
                                                          )),
                                                    ],
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
                          );
                        },
                      )
                // : const SizedBox(
                //     height: 60.0,
                //     child: Center(child: CircularProgressIndicator()),
                //   )
                )),
        cartData == null
            ? const Center(
                child: Text(
                  "",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : Container(
                height: 200 * ffem,
                //width: Get.width / 1.1,
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 7, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('Subtotal :',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000))),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                '\$$totalprice',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1725 * fem / fem,
                                  color: const Color(0xff595959),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 7, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('Shipping fee :',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000))),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'TCB',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1725 * fem / fem,
                                  color: const Color(0xff595959),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 7, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('Coupon discount :',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000))),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                '\$0.0',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * fem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1725 * fem / fem,
                                  color: const Color(0xff595959),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 0.1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 7, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text('Total :',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000))),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                '\$$totalprice',
                                style: GoogleFonts.poppins(
                                  fontSize: 16 * fem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1725 * fem / fem,
                                  color: const Color(0xff039789),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
                              Get.to(() => const CheckoutScreen(),
                                  transition: Transition.fadeIn);
                            },
                            child: Container(
                              //width: 315 * fem,
                              height: 40 * fem,
                              decoration: BoxDecoration(
                                color: const Color(0xfff26122),
                                borderRadius: BorderRadius.circular(20 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Checkout',
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
              )
      ],
    )));
  }

  deleteCart(cartId) async {
    try {
      response = await http.post(Uri.parse(ApiProvider.cartquantity),
          body: {'cart_id': cartId, 'quantity': '0'});
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        String userMessage = jsonData['message'];

        if (jsonData['status'] != 0) {
          getCardList(getUserId);
          SnackbarUtils.showFloatingSnackbar("Card Remove", userMessage);
        } else {
          SnackbarUtils.showFloatingSnackbar("Card Remove", userMessage);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
