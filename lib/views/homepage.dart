import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/datasavingcontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Uint8List? imageFile;

  TextEditingController titleController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> types = ["Apple", "Ball", "Cat"];

  TextEditingController days = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin panel"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            GetBuilder<DataSavingController>(
              init: DataSavingController(),
              builder: (controller) {
                return ListTile(
                  title: const Text("Logout"),
                  trailing: Icon(Icons.logout),
                  onTap: () {
                    // controller.logout();
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/login', (route) => false);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Warning"),
                          content: const Text("Do You want to logout?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.logout();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/login',
                                  (route) => false,
                                );
                              },
                              child: const Text("Yes"),
                            ),
                            DropdownButtonFormField(
                              onChanged: (val) {
                                days.text = val.toString();
                              },
                              items: [
                                for (String val in types)
                                  DropdownMenuItem(
                                    child: Text(
                                      val.toString(),
                                    ),
                                    value: val,
                                  ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      body: Container(),

      // body: Form(
      //   key: formKey,
      //   child: Column(
      //     children: [
      //       TextFormField(
      //         controller: titleController,
      //         decoration: InputDecoration(
      //           hintText: "Enter title",
      //         ),
      //         validator: (val) {
      //           if (val.toString().length == 0) {
      //             return 'please enter title';
      //           }
      //           if (val.toString().length != 10) {
      //             return "Should be 10 letters";
      //           }
      //           return null;
      //         },
      //       ),
      //       TextButton(
      //         onPressed: () async {
      //           final ImagePicker _picker = ImagePicker();
      //           // Pick an image
      //           final XFile? image =
      //               await _picker.pickImage(source: ImageSource.gallery);
      //           imageFile = await image!.readAsBytes();
      //           setState(() {});
      //         },
      //         child: Text("Pick Image"),
      //       ),
      //       Container(
      //         height: 150,
      //         width: 150,
      //         color: Colors.grey,
      //         child: imageFile == null
      //             ? Text("Select Image")
      //             : Image.memory(imageFile!),
      //       ),
      //       GetBuilder<UploadMovieController>(
      //           init: UploadMovieController(),
      //           builder: (controller) {
      //             return TextButton(
      //               onPressed: () {
      //                 if (formKey.currentState!.validate()) {}
      //               },
      //               child: Text("Upload"),
      //             );
      //           }),
      //     ],
      //   ),
      // ),
    );
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Homepage"),
    //     ),
    //     body: Column(
    //       children: [
    //         imageFile == null
    //             ? Container(
    //                 height: 50,
    //                 width: 50,
    //                 color: Colors.red,
    //                 child: Center(),
    //               )
    //             : Image.memory(
    //               imageFile!,
    //             ),
    //         TextButton(
    //           onPressed: () {
    //             imageFile = null;
    //             setState(() {});
    //           },
    //           child: Text("Remove"),
    //         ),
    //         TextButton(
    //           onPressed: () async {
    //             showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   title: const Text("Choose source"),
    //                   content: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       ListTile(
    //                         leading: const Icon(Icons.camera),
    //                         title: const Text("Camera"),
    //                         onTap: () async {
    //                           final ImagePicker _picker = ImagePicker();
    //                           final XFile? image = await _picker.pickImage(
    //                               source: ImageSource.camera);
    //                           Navigator.pop(context);
    //                           imageFile = await image!.readAsBytes();
    //                           setState(() {});
    //                         },
    //                       ),
    //                       ListTile(
    //                         leading: const Icon(Icons.filter_frames_sharp),
    //                         title: const Text("Gallery"),
    //                         onTap: () async {
    //                           final ImagePicker _picker = ImagePicker();
    //                           final XFile? image = await _picker.pickImage(
    //                               source: ImageSource.gallery);
    //                           Navigator.pop(context);

    //                           imageFile = await image!.readAsBytes();
    //                           setState(() {});
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             );
    //           },
    //           child: const Text(
    //             "Pick Image",
    //           ),
    //         ),
    //         TextFormField(
    //           decoration: InputDecoration(
    //             hintText: "Movie title",
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    // Drawer sideDrawer() {
    //   return Drawer(
    //     child: ListView(
    //       children: [
    //         GetBuilder<ThemeController>(
    //             init: ThemeController(),
    //             builder: (themeController) {
    //               return SwitchListTile(
    //                 value: themeController.isDarkTheme,
    //                 title: const Text("Switch to dark theme"),
    //                 onChanged: (value) {
    //                   themeController.toggleTheme();
    //                 },
    //               );
    //             }),
    //         Container(
    //           height: 150,
    //           color: Colors.blue,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Image.asset(
    //                 "assets/bgimage.jpeg",
    //                 fit: BoxFit.cover,
    //               ),
    //               const Text("Movie"),
    //             ],
    //           ),
    //         ),
    //         const ListTile(
    //           title: Text("Homepage"),
    //           leading: Icon(Icons.home),
    //         ),
    //         const ListTile(
    //           title: Text("About us"),
    //           leading: Icon(Icons.note),
    //         ),
    //       ],
    //     ),
    //   );
  }
}
