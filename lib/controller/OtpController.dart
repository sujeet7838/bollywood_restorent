import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/Home/app_home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bollybood_restorent/api/SnackbarUtils.dart';

class OTPController extends GetxController {
  final String apiUrl = ApiProvider.VALIDATE_OTP;
  final String checkEmail = ApiProvider.DuplicateEmail;
  RxBool isDataLoading = false.obs;

  void verifyOTP(
    String etEmail,
    otp,
  ) async {
    try {
      isDataLoading.value = true;
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': etEmail, 'otp': otp.toString()},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String userMessage = responseBody['message'];

        if (responseBody['status'] == 0) {
          Get.to(() => const AppHomeScreen(), transition: Transition.fadeIn);
          SnackbarUtils.showFloatingSnackbar("Verification code ", userMessage);
        } else {
          SnackbarUtils.showFloatingSnackbar("Verification code ", userMessage);
        }
      } else {
        SnackbarUtils.showFloatingSnackbar(
            "Verification code", "Verification code Failed");
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isDataLoading.value = false;
    }
  }
}
