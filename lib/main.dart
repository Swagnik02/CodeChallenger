import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Consolas',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: ColorPalette.primaryTextColor),
          bodyMedium: TextStyle(color: ColorPalette.primaryTextColor),
          bodySmall: TextStyle(color: ColorPalette.primaryTextColor),
          displaySmall: TextStyle(color: ColorPalette.primaryTextColor),
          headlineSmall: TextStyle(color: ColorPalette.primaryTextColor),
          headlineMedium: TextStyle(color: ColorPalette.primaryTextColor),
          labelMedium: TextStyle(color: ColorPalette.primaryTextColor),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      // routes: ,
    );
  }
}
