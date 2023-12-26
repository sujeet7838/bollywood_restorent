import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SelectLocation extends StatelessWidget {
  final String locationName;
  SelectLocation({required this.locationName});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    int _value = 0;
    return GestureDetector(
      onTap: () {
        print(context);
        // Get.to(() => projectDashboardScreen(),
        //     transition: Transition.fade);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: Card(
          color: const Color(0xFFF1F1F1),
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: Image.asset(
                "assets/mapicon.png",
                scale: 1,
              ),
            ),
            title: Text(
              'Test',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.1725,
                color: const Color(0xff282828),
              ),
            ),
            trailing: Radio(
              //value: 2,
              groupValue: _value,
              activeColor: Color(0xFF039789),
              onChanged: (value) {}, value: 0,
            ),
            // trailing: const Icon(
            //   Icons.arrow_forward_ios_rounded,
            //   size: 15,
            // ),
          ),
        ),
      ),
    );
  }
}
