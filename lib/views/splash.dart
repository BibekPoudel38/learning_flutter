import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/datasavingcontroller.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  goToHomepage(BuildContext context, DataSavingController controller) {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) async {
        await controller.isLoggedin()
            ? Navigator.pushNamedAndRemoveUntil(
                context, '/homepage', (route) => false)
            : Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataSavingController>(
      init: DataSavingController(),
      builder: (controller) {
        goToHomepage(context, controller);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.gif',
                  height: 120,
                  width: 120,
                ),
                const CircularProgressIndicator(),
                const Text(
                  "Welcome to my app",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
