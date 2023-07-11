import 'package:flutter/material.dart';
import 'package:flutter_less4/widgets/to_do.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 129, 184, 211),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 53, 79),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((value) {
  runApp(
    MaterialApp(
      // Dark theme
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        
        // cardTheme: const CardTheme().copyWith(
        //   color: kDarkColorScheme.secondaryContainer,
        //   margin: const EdgeInsets.symmetric(
        //     horizontal: 16,
        //     vertical: 8,
        //   ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
      // Light theme
      theme: ThemeData().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        // cardTheme: const CardTheme().copyWith(
        //   color: kColorScheme.secondaryContainer,
        //   margin: const EdgeInsets.symmetric(
        //     horizontal: 16,
        //     vertical: 8,
        //   ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            // backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ToDo(),
    ),
  );
  // });  for set device orientation
}
