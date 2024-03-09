import 'package:flutter/material.dart';
import 'package:iste9far/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 30,
            )),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
          ),
          bodyMedium: TextStyle(
          ),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconSize: MaterialStatePropertyAll(22),
              iconColor: MaterialStatePropertyAll(Colors.white)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
