import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/loginmode.dart';
import 'package:movie_app/models/moviesmodel.dart';
import 'package:movie_app/models/profilemodel.dart';

class RemoteServices {
  static http.Client client = http.Client();
  static String initialUrl = "http://192.168.1.66/learning";
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
    return response.body;
  }

  static Future<String> uploadMovie(MoviesModel model) async {
    Uri url = Uri.parse('$initialUrl/movies/create.php');
    var response = await client.post(url, body: moviesModelToJson(model));
    return response.body;
  }

  static Future<String> fetchMovies() async {
    Uri url = Uri.parse('$initialUrl/movies/readmovie.php');
    var response = await client.get(url);
    return response.body;
  }

  static Future<String> searchMovies(String query) async {
    Uri url = Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?query_term=$query&page=1');
    var response = await client.get(url);
    return response.body;
  }
}
