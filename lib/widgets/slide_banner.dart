import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/utils/show_message_dialog.dart';
import 'package:flutter/material.dart';

class SlideBanner extends StatelessWidget {
  SlideBanner({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return GestureDetector(
      onTap: () {
        // showMessageDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
