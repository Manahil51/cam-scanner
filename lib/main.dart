import 'package:cam_scanner/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScannerPage(),
    );
  }
}
