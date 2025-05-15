import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'utils/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorConstants.colorPrimary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorConstants.colorPrimary,
          secondary: ColorConstants.colorAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}