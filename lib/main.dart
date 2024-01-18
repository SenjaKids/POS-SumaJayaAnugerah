import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/App/nav_admin.dart';
import 'package:suma_jaya_anugerah/App/nav_staff.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/login.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/splashscreen.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_request_form.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_request_history.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_return_form.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/task_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/task_report.dart';
import 'package:suma_jaya_anugerah/features/Profile/presentation/pages/home_staff.dart';
import 'package:suma_jaya_anugerah/features/Profile/presentation/pages/profile.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_request_form.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_staff.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenPage(),
        '/login': (context) => const LoginPage(),
        '/nav-staff': (context) => const NavStaff(),
        '/home-staff': (context) => const HomeStaffPage(),
        '/profile': (context) => ProfilePage(
              isAdmin: ModalRoute.of(context)!.settings.arguments as bool,
            ),
        '/tools-staff': (context) => const ToolsStaffPage(),
        '/tools-details-staff': (context) => ToolsDetailsStaffPage(
              borrowStatus: ModalRoute.of(context)!.settings.arguments as int,
            ),
        '/tools-request-form': (context) => const ToolsRequestFormPage(),
        '/task-details-staff': (context) => TaskDetailsStaffPage(
              isDone: ModalRoute.of(context)!.settings.arguments as bool,
            ),
        '/task-report': (context) => const TaskReportPage(),
        '/inventory-details-staff': (context) => InventoryDetailsStaffPage(
            pageStatus: ModalRoute.of(context)!.settings.arguments as int),
        '/inventory-request-form': (context) =>
            const InventoryRequestFormPage(),
        '/inventory-request-history': (context) =>
            const InventoryRequestHistoryPage(),
        '/inventory-return-form': (context) => const InventoryReturnFormPage(),
        '/nav-admin': (context) => const NavAdmin(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
