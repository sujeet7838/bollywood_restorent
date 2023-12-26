import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/widgets/major_category_button.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      //height: 80 * ffem,
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
      ),
      //  const Padding(
      //       padding: EdgeInsets.only(
      //         top: 10.0,
      //         bottom: 5.0,
      //         left: 8.0,
      //         right: 8.0,
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.only(left: 10.0, right: 10.0),
      //         //color: Colors.amber,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               'Upcoming Events',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w700,
      //                 fontSize: 16,
      //                 color: Colors.black,
      //               ),
      //             ),
      //             Row(
      //               children: [
      //                 Text(
      //                   'More',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 13,
      //                     color: colorGoldenYellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.arrow_forward_ios,
      //                   size: 10,
      //                   color: colorGoldenYellow,
      //                 )
      //               ],
      //             )
      //           ],
      //         ),
      //       )),
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 0.0,
        ),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          SizedBox(
            width: 28.0,
          ),
          MajorCategoryButton(
            iconUrl: 'assets/combo-icon.png',
            label: 'Combo',
            isSelected: true,
          ),
          SizedBox(
            width: 10.0,
          ),
          MajorCategoryButton(
            iconUrl: 'assets/lunch-icon.png',
            label: 'Lunch',
            isSelected: true,
          ),
          SizedBox(
            width: 10.0,
          ),
          MajorCategoryButton(
            iconUrl: 'assets/group-icon.png',
            label: 'Entress',
            isSelected: true,
          ),
          SizedBox(
            width: 14.0,
          ),
          MajorCategoryButton(
            iconUrl: 'assets/chicken-icon.png',
            label: 'Chicken',
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
