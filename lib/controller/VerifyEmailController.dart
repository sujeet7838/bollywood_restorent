import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/verify/otpScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bollybood_restorent/api/SnackbarUtils.dart';

class VerifyEmailController extends GetxController {
  final String apiUrl = ApiProvider.Verify_Email;
  final String checkEmail = ApiProvider.DuplicateEmail;
  RxBool isDataLoading = false.obs;

  void verifEmail(
    String etEmail,
  ) async {
    try {
      isDataLoading.value = true;
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': etEmail,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String userMessage = responseBody['message'];
        int userotP = responseBody['verification_code'];

        if (responseBody['status'] != 0) {
          // Get.to(() => const otpScreen(), transition: Transition.fadeIn);
          SnackbarUtils.showFloatingSnackbar(
              "Verification code ", '$userMessage' " - " + userotP.toString());
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
