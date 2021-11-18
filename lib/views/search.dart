import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/searchcontroller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              onChanged: (value) {
                controller.search(value);
              },
              decoration: InputDecoration(
                hintText: "Search movies",
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: controller.searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.searchResults[index].title),
              );
            },
          ),
        );
      },
    );
  }
}
