import 'package:get/get.dart';
import 'package:movie_app/models/profilemodel.dart';
import 'package:movie_app/remoteservices.dart';

class SignupController extends GetxController {
  bool isLoading = false;

  signup(ProfileModel model) async {
    isLoading = true;
    update();
    var response = await RemoteServices.signUpUser(model);
    isLoading = false;
    update();
  }
}
