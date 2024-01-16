import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/App/nav_staff.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/login.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/splashscreen.dart';
import 'package:suma_jaya_anugerah/features/Profile/presentation/pages/home_staff.dart';
import 'package:suma_jaya_anugerah/features/Profile/presentation/pages/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: '/nav-staff',
      routes: {
        '/': (context) => const SplashScreenPage(),
        '/login': (context) => const LoginPage(),
        '/nav-staff': (context) => const NavStaff(),
        '/home-staff': (context) => const HomeStaffPage(),
        '/profile': (context) => const ProfilePage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
