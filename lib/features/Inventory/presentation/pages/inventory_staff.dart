import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/widgets/inventory_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class InventoryStaffPage extends StatelessWidget {
  const InventoryStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SJAMenuPage(
      pageTitle: 'List Bahan',
      action1: 'history',
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
            // onTap: () => Navigator.pushNamed(context, '/product-details'),
            child: const InventoryCard(),
          ),
        ),
      ),
    );
  }
}
