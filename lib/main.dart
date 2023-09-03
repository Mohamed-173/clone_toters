import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toters_ui_clone/pages/main_home_clone.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.black

          // primarySwatch: Colors.white,
          ),
      home: HomePage(),
    );
  }
}
