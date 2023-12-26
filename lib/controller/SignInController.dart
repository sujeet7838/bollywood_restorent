import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/features/Home/app_home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bollybood_restorent/api/SnackbarUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  final String apiUrl = ApiProvider.SIGN_IN;
  RxBool isDataLoading = false.obs;

  void signIn(String etEmail, String etPassword) async {
    try {
      isDataLoading.value = true;
      var response = await http.post(Uri.parse(apiUrl), body: {
        'email': etEmail,
        'password': etPassword,
      }, headers: {
        "Access-Control_Allow_Origin": "*"
      });
      if (response.statusCode == 200) {
        // Map<String, dynamic> responseBody = json.decode(response.body);
        // String userMessage = responseBody['message'];

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var responseBody = json.decode(response.body);
        String userMessage = responseBody['message'];
        var dataId = responseBody['data']['id'].toString();

        await sharedPreferences.setString("userID", dataId);
        var userDataId = sharedPreferences.getString("userID");

        if (responseBody['status'] != 0) {
          Get.to(() => const AppHomeScreen(), transition: Transition.fadeIn);
          SnackbarUtils.showFloatingSnackbar("Sign In Status", userMessage);
        } else {
          SnackbarUtils.showFloatingSnackbar("Sign In Status", userMessage);
        }
      } else {
        SnackbarUtils.showFloatingSnackbar("Sign In Status", "Sign In Failed");
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      isDataLoading.value = false;
    }
  }
}
