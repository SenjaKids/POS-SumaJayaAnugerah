import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/widgets/inventory_card.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class InventoryStaffPage extends StatelessWidget {
  const InventoryStaffPage({super.key});

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent),
  // );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SJAMenuPage(
        pageTitle: 'List Bahan',
        action1: 'history',
        action1OnTap: () =>
            Navigator.pushNamed(context, '/inventory-request-history'),
        enableSearch: true,
        hintText: 'Cari Bahan...',
        content: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (1 * 0.8),
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            7,
            (index) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/inventory-details-staff',
                arguments: 0,
              ),
              child: const InventoryCard(),
            ),
          ),
        ),
      ),
    );
  }
}
