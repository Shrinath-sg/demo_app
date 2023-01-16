import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_project/models/home_model.dart';
import 'package:demo_project/models/location_model.dart';
import 'package:demo_project/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:demo_project/utils/constants.dart' as constants;

class ApiService {
  static Future<LoginDataModel> loginApi({String? mobile, String? pin}) async {
    try {
      const url = constants.login;
      final uri = Uri.parse(url);
      log("here***********************url --> ${url}");
      log(jsonEncode({
        "userName": mobile,
        "password": pin,
        "deviceId": "2454957943759438759843",
        "deviceToken": "sasas121213ewaafrafdaf"
      }));
      final response = await http.post(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          uri,
          body: jsonEncode(<String, dynamic>{
            "userName": mobile,
            "password": pin,
            "deviceId": "2454957943759438759843",
            "deviceToken": "sasas121213ewaafrafdaf"
          }));
      log(jsonEncode(response.statusCode));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(response.body) as Map<String, dynamic>;
        final data = LoginDataModel.fromJson(json);

        return data;
      }

      return LoginDataModel();
    } on SocketException {
      throw Exception('No Internet');
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  static Future<HomeDataModel> getHomeScreenData(
      {required String? authToken, required String? vehicleNo}) async {
    try {
      const url = constants.homedata;
      final uri = Uri.parse(url);
      // log("here***********************url --> ${url}");
      // log(jsonEncode({
      //   "userName": mobile,
      //   "password": pin,
      //   "deviceId": "2454957943759438759843",
      //   "deviceToken": "sasas121213ewaafrafdaf"
      // }));
      final response = await http.post(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          uri,
          body: jsonEncode(<String, dynamic>{
            "authToken": authToken,
            "vehicleNo": vehicleNo,
            "startDate": "2020-03-01",
            "endDate": "2020-03-03",
            "reportMode": "M"
          }));
      log(jsonEncode(response.statusCode));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(response.body) as Map<String, dynamic>;
        final data = HomeDataModel.fromJson(json);

        return data;
      }

      return HomeDataModel();
    } on SocketException {
      throw Exception('No Internet');
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  static Future<LocationDataModel> getLocationData(
      {required String? authToken, required String? vehicleNo}) async {
    try {
      const url = constants.getlocation;
      final uri = Uri.parse(url);
      // log("here***********************url --> ${url}");
      // log(jsonEncode({
      //   "userName": mobile,
      //   "password": pin,
      //   "deviceId": "2454957943759438759843",
      //   "deviceToken": "sasas121213ewaafrafdaf"
      // }));
      final response = await http.post(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          uri,
          body: jsonEncode(<String, dynamic>{
            "authToken": authToken,
            "vehicleNo": vehicleNo,
            "vehicleId": "",
            "unitNo": ""
          }));
      inspect(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(response.body) as Map<String, dynamic>;
        final data = LocationDataModel.fromJson(json);

        return data;
      }

      return LocationDataModel();
    } on SocketException {
      throw Exception('No Internet');
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }
}
