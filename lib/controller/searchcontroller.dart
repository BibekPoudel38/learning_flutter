import 'package:get/get.dart';
import 'package:movie_app/models/moviesmodel.dart';
import 'package:movie_app/remoteservices.dart';

class SearchController extends GetxController {
  List<MoviesModel> searchResults = <MoviesModel>[];

  search(String query) async {
    var response = await RemoteServices.searchMovies(query);
    searchResults = moviesModelsFromJson(response);
    update();
  }
}
