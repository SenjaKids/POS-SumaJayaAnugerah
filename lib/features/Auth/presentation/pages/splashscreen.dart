import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // _setTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child:
            // Image.asset(
            //   'assets/images/logo.png',
            //   width: 120,
            //   height: 120,
            // ),
            SvgPicture.asset(
          'assets/images/logo.svg',
        ),
      ),
    );
  }

  void _setTimer() {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.popAndPushNamed(context, '/login');
      },
    );
  }
}
