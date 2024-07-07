import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  dynamic _scannedImage;

  Future<void> _scanDocument() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _scannedImage = pickedFile.path;
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      setState(() {});
    } on PlatformException catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      setState(() {});
    } on PlatformException catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _scannedImage != null
                ? Image.file(
                    File(_scannedImage),
                    height: 300,
                  )
                : const Text('No document scanned yet'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanDocument,
              child: const Text('Scan Document'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: const Text('Open Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
