import 'dart:developer';

import 'package:demo_project/models/home_model.dart';
import 'package:demo_project/models/location_model.dart';
import 'package:demo_project/models/login_model.dart';
import 'package:demo_project/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProvider extends ChangeNotifier {
  LoginDataModel loginData = LoginDataModel();
  HomeDataModel homeData = HomeDataModel();
  LocationDataModel locationData = LocationDataModel();

  bool isLoading = false;

  Future<bool> login(String? mobile, String? pin) async {
    try {
      isLoading = true;
      notifyListeners();
      loginData = await ApiService.loginApi(mobile: mobile, pin: pin);
      if (loginData.status != null && loginData.status == '200') {
        return true;
      } else {
        Fluttertoast.showToast(
            msg: loginData.errorDetail != null
                ? loginData.errorDetail!.message.toString()
                : 'Oops!! Something went wrong');
        return false;
      }
    } catch (err) {
      Fluttertoast.showToast(msg: 'Oops!! Something went wrong');
      print(err.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return false;
  }

  getHomeScreenData() async {
    try {
      isLoading = true;
      // notifyListeners();
      homeData = await ApiService.getHomeScreenData(
          authToken: loginData.authToken,
          vehicleNo: loginData.policyDetails!.first!.vehicleNo);
      if (homeData.status != null && homeData.status == '200') {
      } else {
        Fluttertoast.showToast(
            msg: homeData.errorDetail != null
                ? homeData.errorDetail!.message.toString()
                : 'Oops!! Something went wrong');
      }
    } catch (err) {
      Fluttertoast.showToast(msg: 'Oops!! Something went wrong');
      print(err.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  getLocationData() async {
    log('here************');
    try {
      isLoading = true;
      locationData = await ApiService.getLocationData(
          authToken: loginData.authToken,
          vehicleNo: loginData.policyDetails!.first!.vehicleNo);
      if (locationData.status != null && locationData.status == '200') {
      } else {
        Fluttertoast.showToast(
            msg: locationData.errorDetail != null
                ? locationData.errorDetail!.message.toString()
                : 'Oops!! Something went wrong');
      }
    } catch (err) {
      Fluttertoast.showToast(msg: 'Oops!! Something went wrong');
      print(err.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
