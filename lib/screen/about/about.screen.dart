import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Widget buildImageContent() {
    if (_image != null) {
      return Image.file(
        _image!,
        fit: BoxFit.cover,
      );
    }
    return Image.asset('assets/images/avatar.jpg');
  }

  Future<void> _getImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _getImage();
            },
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: ClipOval(
                child: buildImageContent(), // Placeholder image
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'User Name',
            style: TextStyle(color: Colors.deepOrange, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
