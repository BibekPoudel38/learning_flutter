import 'package:get/get.dart';
import 'package:movie_app/models/moviesmodel.dart';
import 'package:movie_app/remoteservices.dart';

class MovieController extends GetxController {
  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  bool uploading = false;

  uploadMovie(MoviesModel model) async {
    uploading = true;
    update();
    var response = await RemoteServices.uploadMovie(model);
    uploading = false;
    update();
  }

  bool fetching = false;
  List<MoviesModel> movies = [];
  Future<List<MoviesModel>> fetchMovies() async {
    fetching = true;
    update();
    var response = await RemoteServices.fetchMovies();
    movies = (moviesModelsFromJson(response));

    fetching = false;
    update();
    return movies;
  }
}
