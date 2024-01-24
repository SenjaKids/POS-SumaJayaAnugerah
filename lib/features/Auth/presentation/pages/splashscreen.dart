import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _setTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 250,
          height: 250,
        ),
        //   SvgPicture.asset(
        // 'assets/images/logo.svg',
        // width: 120,
        // ),
      ),
    );
  }

  void _setTimer() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.popAndPushNamed(context, '/login');
      },
    );
  }
}
