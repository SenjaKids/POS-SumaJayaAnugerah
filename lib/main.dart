import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/App/nav_admin.dart';
import 'package:suma_jaya_anugerah/App/nav_staff.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/login.dart';
import 'package:suma_jaya_anugerah/features/Auth/presentation/pages/splashscreen.dart';
import 'package:suma_jaya_anugerah/features/Catalog/presentation/pages/catalog_detail.dart';
import 'package:suma_jaya_anugerah/features/Catalog/presentation/pages/create_catalog.dart';
import 'package:suma_jaya_anugerah/features/Catalog/presentation/pages/edit_catalog.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_request_form.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_request_history.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_return_form.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/assign_task.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/assign_task_details.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/create_order.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/create_task.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/order_details.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/task_details_admin.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/task_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/task_report.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/create_tool.dart';
import 'package:suma_jaya_anugerah/features/User/presentation/pages/create_staff.dart';
import 'package:suma_jaya_anugerah/features/User/presentation/pages/home_staff.dart';
import 'package:suma_jaya_anugerah/features/User/presentation/pages/profile.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_details_staff.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_request_form.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_staff.dart';
import 'package:suma_jaya_anugerah/features/User/presentation/pages/staff_detail.dart';

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
        '/create-order': (context) => const CreateOrderFormPage(),
        '/create-catalog': (context) => const CreateCatalogFormPage(),
        '/catalog-detail': (context) => const CatalogDetailPage(),
        '/edit-catalog': (context) => const EditCatalogFormPage(),
        '/staff-detail': (context) => const StaffDetailPage(),
        '/create-staff': (context) => const CreateStaffFormPage(),
        '/order-details': (context) => OrderDetailsPage(
            isDone: ModalRoute.of(context)!.settings.arguments as bool),
        '/create-task': (context) => const CreateTaskFormPage(),
        '/task-details-admin': (context) => TaskDetailsAdminPage(
            isDone: ModalRoute.of(context)!.settings.arguments as bool),
        '/assign-task': (context) => const AssignTaskPage(),
        '/assign-task-details': (context) => AssignTaskDetailsPage(
            isDone: ModalRoute.of(context)!.settings.arguments as bool),
        '/create-tool': (context) => const CreateToolFormPage(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
