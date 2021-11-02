import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/loginmode.dart';
import 'package:movie_app/models/profilemodel.dart';
import 'package:movie_app/remoteservices.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  late ProfileModel profile;
  loginUser(LoginModel model, BuildContext context) async {
    isLoading = true;
    update();
    var response = await RemoteServices.loginUser(model);
    try {
      if (json.decode(response)['status'] ==
          "Account with the email doesn't exist.") {
        Fluttertoast.showToast(msg: "Invalid Login");
      } else {
        profile = profileModelFromJson(response);
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/homepage",
          (route) => false,
        );
      }
    } on Exception catch (e) {
      log("Login failed $e");
    }
    print(response);
    isLoading = false;
    update();
  }
}
