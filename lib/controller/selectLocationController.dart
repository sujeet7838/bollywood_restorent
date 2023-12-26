import 'dart:convert';

import 'package:bollybood_restorent/Api/api_provider.dart';
import 'package:bollybood_restorent/Api/model/selectLocationModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SelectLocationController extends GetxController {
  RxList<SelectLocationModel> propertyTypes = <SelectLocationModel>[].obs;
  RxBool isDataLoading = false.obs;

  Future<void> fetchPropertyTypes(token) async {
    final response = await http.get(Uri.parse(ApiProvider.StoreLocation));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      propertyTypes.value = data['data']
          .map<SelectLocationModel>(
              (item) => SelectLocationModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load property types');
    }
  }

  // Future<void> getLocationData() async {
  //   try {
  //     isLoading(true);
  //     var response = await http.get(Uri.parse(ApiProvider.StoreLocation));
  //     print("Status_Code${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       //   print("jsonResponse" + jsonResponse.toString());
  //       selectLocationModel = SelectLocationModel.fromJson(
  //           jsonResponse.toString() as Map<String, dynamic>);
  //       //  var locationlistData.value = SelectLocationModel.fromJson(
  //       //       jsonResponse.toString() as Map<String, dynamic>);
  //     } else {
  //       //noob(true);
  //       print('API call failed with status code ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error while fetching project details: $error');
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
