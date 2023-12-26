import 'package:flutter/material.dart';

class HomeViewSearchBar extends StatelessWidget {
  const HomeViewSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFd3d3d3)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.grey,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Item',
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
