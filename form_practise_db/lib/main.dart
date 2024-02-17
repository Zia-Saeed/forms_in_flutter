import 'package:flutter/material.dart';
import 'package:form_practise_db/Signup.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryTextTheme: TextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 120, 100, 0),
        ),
        // textTheme: GoogleFonts.alegreyaScTextTheme(),
      ),
      home: const Scaffold(body: SignUp()),
    );
  }
}
