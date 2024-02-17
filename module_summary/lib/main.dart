import "package:flutter/material.dart";
import 'package:module_summary/expenses.dart';
// import 'package:flutter/services.dart';

// use K for global variable for flutter syntax.
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kdarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, // color scheme for the widgets in dark mode
  seedColor: const Color.fromARGB(255, 5, 99, 125),
); // it will create different shades of colors based on one seed color.

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fun) {}); //.then() me  accepts function in its parameter.
  runApp(
    MaterialApp(
      home: const Expenses(),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kdarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          // shadowColor: kColorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkColorScheme.primaryContainer,
            foregroundColor: kdarkColorScheme.onPrimaryContainer,
          ),
        ),
        // setting up dark theme.
      ),
      //changing theme for the app bar use this
      theme: ThemeData().copyWith(
          useMaterial3: true,
          // scaffoldBackgroundColor: const Color.fromARGB(255, 164, 108, 174),
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            // shadowColor: kColorScheme.onPrimary,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16,
                ), // the text used in appbar is titlelarge
              ) //on elevated button object there is no copy method
          //overwriting defalut settings
          //overwriting the above defalut settings
          // appBarTheme: AppBarTheme(color: Colors.amber),
          ),
      themeMode:
          ThemeMode.dark, // using themeMode.system to let use pick the value
      // themeMode: ThemeMode.dark, //using default theme selected by flutter.
      // it will change the styling of UI a little bit.
    ),
  );
}
