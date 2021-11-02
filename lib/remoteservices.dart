import 'package:http/http.dart' as http;
import 'package:movie_app/models/loginmode.dart';
import 'package:movie_app/models/profilemodel.dart';

class RemoteServices {
  static http.Client client = http.Client();
  static String initialUrl = "http://192.168.1.80/learning";
  static signUpUser(ProfileModel model) async {
    Uri url = Uri.parse("$initialUrl/signUp.php");
    var response = await client.post(
      url,
      body: profileModelToJson(model),
    );
    print(response.body);
  }

  static Future<String> loginUser(LoginModel model) async {
    Uri url = Uri.parse(
        "$initialUrl/login.php?email=${model.email}&password=${model.password}");
    var response = await client.get(url);
    print(response.body);
    return response.body;
  }
}
