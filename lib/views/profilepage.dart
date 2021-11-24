import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/datasavingcontroller.dart';
import 'package:movie_app/models/profilemodel.dart';
import 'package:movie_app/remoteservices.dart';

class Profile extends StatelessWidget {
  late ProfileModel profile;
  loadProfile(DataSavingController controller) async {
    profile = await controller.readProfile();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataSavingController>(
      init: DataSavingController(),
      builder: (controller) {
        loadProfile(controller);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: [
                Image.network(
                  "${RemoteServices.initialUrl}${profile.profileImage}",
                ),
                Text(profile.username),
              ],
            ),
          ),
        );
      },
    );
  }
}
