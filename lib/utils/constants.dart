import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kNewsCycleFont = GoogleFonts.newsCycle(fontWeight: FontWeight.w700);

const kApiKey = "3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9";

final kTextTheme = TextTheme(
  subtitle1: kNewsCycleFont.apply(color: Colors.black),
  headline6: kNewsCycleFont.apply(color: Colors.black),
  bodyText2: TextStyle(color: Colors.black),
);
