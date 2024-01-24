import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/widgets/inventory_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class InventoryAdminPage extends StatelessWidget {
  const InventoryAdminPage({super.key});

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
        action1: 'add',
        action2: 'history',
        action3: 'notification',
        action1OnTap: () => Navigator.pushNamed(context, '/create-inventory'),
        action2Ontap: () =>
            Navigator.pushNamed(context, '/inventory-request-history'),
        action3Ontap: () => Navigator.pushNamed(context, '/inventory-request'),
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
            9,
            (index) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/inventory-details-admin',
              ),
              child: const InventoryCard(),
            ),
          ),
        ),
      ),
    );
  }
}
