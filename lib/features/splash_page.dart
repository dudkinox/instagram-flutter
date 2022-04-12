import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = 'SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const TAG = 'SplashPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorFiltered(
        colorFilter: ColorFilter.linearToSrgbGamma(),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/BAMU_LOGO.svg',
            height: 200,
          ),
        ),
      ),
    );
  }
}
