import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:bollybood_restorent/utils/utils.dart';
import 'package:flutter/material.dart';

class MajorCategoryButton extends StatelessWidget {
  const MajorCategoryButton({
    Key? key,
    required this.iconUrl,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  final String iconUrl;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMessageDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 11.0,
        ),
        decoration: BoxDecoration(
          color: colorLightGoldenYellow,
          borderRadius: BorderRadius.circular(8.0),
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
              iconUrl,
              height: 20.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              label,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 2.0,
                color: const Color(0xff595959),
              ),
            )
          ],
        ),
      ),
    );
  }
}
