import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/moviescontroller.dart';
import 'package:movie_app/remoteservices.dart';

class ViewMovies extends StatelessWidget {
  const ViewMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (controller) {
          return controller.fetching
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(RemoteServices.initialUrl +
                          controller.movies[index].title),
                    );
                  },
                );
        },
      ),
    );
  }
}
