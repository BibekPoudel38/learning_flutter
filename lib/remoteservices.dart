import 'package:http/http.dart' as http;
import 'package:movie_app/models/profilemodel.dart';

class RemoteServices {
  static http.Client client = http.Client();
  static signUpUser(ProfileModel model) async {
    Uri url = Uri.parse("http://localhost/learning/signup.php");
    var response = await client.post(
      url,
      body: profileModelToJson(model),
    );
    print(response.body);
  }
}
