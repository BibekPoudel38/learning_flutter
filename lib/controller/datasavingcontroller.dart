import 'package:get/get.dart';
import 'package:movie_app/models/profilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSavingController extends GetxController {
  late SharedPreferences prefs;
  saveProfile(ProfileModel profile) async {
    String profileString = profileModelToJson(profile);
    prefs = await SharedPreferences.getInstance();
    prefs.setString('profile', profileString);
  }

  logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('profile');
  }

  Future<bool> isLoggedin() async {
    prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('profile') ?? "";
    if (data == "") {
      return false;
    } else {
      ProfileModel profile = profileModelFromJson(data);
      if (profile.username.isNotEmpty &&
          profile.password.isNotEmpty &&
          profile.email.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<ProfileModel> readProfile() async {
    prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('profile')!;
    ProfileModel profile = profileModelFromJson(data);
    return profile;
  }

  saveTheme(bool isDark) async {}
  readTheme() async {}
}
