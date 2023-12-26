import 'dart:convert';
import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/Api/model/menuListModel.dart';
import 'package:bollybood_restorent/features/productScreen/productDetails.dart';

import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen>
    with SingleTickerProviderStateMixin {
  final bool isSelected = false;

  String dropdownvalue = 'Bollywood Hastings';
  var items = [
    'Bollywood Hastings',
    'Bollywood Napier',
    'Bollywood Gisborne',
  ];

  @override
  void initState() {
    getMenuListData();
    super.initState();
  }

  var menuResp, getMenuTypeData;
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
                      "Menus",
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
                Container(
                    width: double.infinity,
                    height: 380 * ffem,
                    // margin: const EdgeInsets.only(
                    //   left: 15,
                    //   right: 15,
                    // ),
                    // padding: const EdgeInsets.symmetric(
                    //   vertical: 0.0,
                    // ),
                    child: menuResp != null
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    //childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 20),
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
                                    decoration: const BoxDecoration(
                                        color: Color(0xffF6F6F6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Wrap(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                width: 250 * ffem,
                                                height: 100 * ffem,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 5),
                                              child: Text(
                                                textAlign: TextAlign.start,
                                                '\$${menuType["price"]}',
                                                overflow: TextOverflow.ellipsis,
                                                style: SafeGoogleFont('Poppins',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    //height: 2.0,
                                                    color: Color(0xFF039789)),
                                              ),
                                            ),
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
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: SafeGoogleFont('Poppins',
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    //height: 2.0,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
              ],
            ),
          ),
        ],
      )),
    );
  }
}
