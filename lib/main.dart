import 'package:flutter/material.dart';
import 'package:expenses_tracker/expenses.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 157, 85, 247),
);

var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 34, 18, 181),
);




void main() {
  runApp(MaterialApp(darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkColorScheme,
  cardTheme: CardTheme().copyWith(
  color: kDarkColorScheme.secondaryContainer, 
  surfaceTintColor: kcolorScheme.onPrimary, 
  elevation: 4, 
  shadowColor: Colors.deepPurpleAccent,
  margin: EdgeInsets.all(16)),),

    theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer,
        ),
       cardTheme: CardTheme().copyWith(
  color: kcolorScheme.secondaryContainer, 
  surfaceTintColor: kcolorScheme.onPrimary, 
  elevation: 4, 
  shadowColor: Colors.deepPurpleAccent,
  margin: EdgeInsets.all(16),
),
elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
            foregroundColor: kcolorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kcolorScheme.onSecondaryContainer)),
    ),
    home: Expenses(),
    themeMode: ThemeMode.system,
  ));
}
