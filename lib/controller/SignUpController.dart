import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/Home/home.dart';
import 'package:bollybood_restorent/features/verify/otpScreen.dart';
import 'package:bollybood_restorent/features/verify/verify_email.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bollybood_restorent/api/SnackbarUtils.dart';

class SignUpController extends GetxController {
  final String apiUrl = ApiProvider.SIGN_UP;
  final String checkEmail = ApiProvider.DuplicateEmail;
  final String checkPhone = ApiProvider.DuplicatePhone;
  final String sendOTp = ApiProvider.Verify_Email;
  RxBool isDataLoading = false.obs;

  void signUp(String etFname, String etLname, String etEmail, String etPhone,
      String etPassword) async {
    try {
      isDataLoading.value = true;
      var response = await http.post(
        Uri.parse(checkEmail),
        body: {
          'firstname': etFname,
          'lastname': etLname,
          'email': etEmail,
          'phone': etPhone,
          'password': etPassword,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String userMessage = responseBody['message'];
        if (responseBody['status'] != 0) {
          // Get.to(() => const VerifyEmailScreen(),
          //     transition: Transition.fadeIn);
          // SnackbarUtils.showFloatingSnackbar("Sign Up Status", userMessage);

          var response = await http.post(
            Uri.parse(apiUrl),
            body: {
              'firstname': etFname,
              'lastname': etLname,
              'email': etEmail,
              'phone': etPhone,
              'password': etPassword,
            },
          );

          if (response.statusCode == 200) {
            Map<String, dynamic> responseBody = json.decode(response.body);
            String userMessage = responseBody['message'];
            if (responseBody['status'] != 0) {
              var response = await http.post(
                Uri.parse(sendOTp),
                body: {
                  'email': etEmail,
                },
              );
              if (response.statusCode == 200) {
                Map<String, dynamic> responseBody = json.decode(response.body);
                String userMessage = responseBody['message'];
                int userotP = responseBody['verification_code'];

                if (responseBody['status'] != 0) {
                  Get.to(
                      () => otpScreen(email: etEmail, otp: userotP.toString()),
                      transition: Transition.fadeIn);
                  SnackbarUtils.showFloatingSnackbar("Verification code ",
                      '$userMessage' " - " + userotP.toString());
                } else {
                  SnackbarUtils.showFloatingSnackbar(
                      "Verification code ", userMessage);
                }
              } else {
                SnackbarUtils.showFloatingSnackbar(
                    "Verification code", "Verification code Failed");
                print(
                    'API call failed with status code: ${response.statusCode}');
              }
            } else {
              SnackbarUtils.showFloatingSnackbar("Sign Up Status", userMessage);
            }
          } else {
            SnackbarUtils.showFloatingSnackbar(
                "Sign Up Status", "Sign Up Failed");
            print('API call failed with status code: ${response.statusCode}');
          }
        } else {
          SnackbarUtils.showFloatingSnackbar("Sign Up Status", userMessage);
        }
      } else {
        SnackbarUtils.showFloatingSnackbar("Sign Up Status", "Sign Up Failed");
        print('API call failed with status code: ${response.statusCode}');
      }

      // if (response.statusCode == 200) {
      //   Map<String, dynamic> responseBody = json.decode(response.body);
      //   String userMessage = responseBody['message'];
      //   if (responseBody['status'] != 0) {
      //     Get.to(() => const VerifyEmailScreen(),
      //         transition: Transition.fadeIn);
      //     SnackbarUtils.showFloatingSnackbar("Sign Up Status", userMessage);
      //   } else {
      //     SnackbarUtils.showFloatingSnackbar("Sign Up Status", userMessage);
      //   }
      // } else {
      //   SnackbarUtils.showFloatingSnackbar("Sign Up Status", "Sign Up Failed");
      //   print('API call failed with status code: ${response.statusCode}');
      // }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isDataLoading.value = false;
    }
  }
}
