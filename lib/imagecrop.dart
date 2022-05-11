import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class imagepick extends StatefulWidget {
  @override
  State<imagepick> createState() => _imagepickState();
}

class _imagepickState extends State<imagepick> {
  final ImagePicker _picker = ImagePicker();
  File? croppedFile;
  String img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image picker"),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    maxRadius: 200,
                    backgroundImage: FileImage(
                      File(img),
                      scale: 200,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      // Pick an image
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);

                      croppedFile = await ImageCropper()
                          .cropImage(sourcePath: image!.path);
                      setState(() {
                        img = image.path;
                      });

                      print("iii==${croppedFile}");
                      print("iii==${image}");
                      print("sss==${img}");
                      uiSettings:
                      [
                        AndroidUiSettings(
                            toolbarTitle: 'Cropper',
                            toolbarColor: Colors.deepOrange,
                            toolbarWidgetColor: Colors.white,
                            initAspectRatio: CropAspectRatioPreset.original,
                            lockAspectRatio: false),
                        IOSUiSettings(
                          title: 'Cropper',
                        ),
                      ];
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
