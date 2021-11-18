import 'package:get/get.dart';
import 'package:movie_app/models/moviesmodel.dart';
import 'package:movie_app/remoteservices.dart';

class UploadMovieController extends GetxController {
  bool isLoading = false;

  uploadMovie(MoviesModel model) async {
    isLoading = true;
    update();
    var response = await RemoteServices.uploadMovie(model);
    isLoading = false;
    update();
  }
}
