import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData jarvisTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  textTheme: GoogleFonts.orbitronTextTheme().apply(bodyColor: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  ),
);
