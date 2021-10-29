import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Picker",
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Center(
              child: Container(
                color: Colors.red,
                height: 120,
                width: 120,
              ),
            ),
            file == null
                ? Container()
                : Image.memory(
                    file!,
                    height: 120,
                    width: 120,
                  ),
            TextButton(
              onPressed: () async {
                final _picker = ImagePicker();
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                file = await image!.readAsBytes();
                setState(() {});
              },
              child: const Text(
                "Pick Image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
