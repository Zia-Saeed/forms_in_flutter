import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  File? selectedImage;
  bool checkstate = false;

  void _takePic() async {
    final imagepicker = ImagePicker();
    print("this function runs ");
    final pickedImage = await imagepicker.pickImage(
      source: ImageSource.camera,
      // maxWidth: 600,
      maxWidth: 300,
    );
    print("this function runs 2");
    if (pickedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(pickedImage.path);
      checkstate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePic,
      icon: const Icon(Icons.camera),
      label: const Text("click to take a Pic"),
    );
    if (selectedImage != null) {
      content = Image.file(
        selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: checkstate
            ? const Text("Taking Picture")
            : const Text("Not Checking state"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: content,
        ),
      ),
    );
  }
}
