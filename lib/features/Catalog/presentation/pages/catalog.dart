import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suma_jaya_anugerah/features/Catalog/presentation/widgets/catalog_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

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
        pageTitle: 'PT. Suma Jaya Anugerah',
        action1: 'user-filled',
        action2: 'add',
        action1OnTap: () =>
            Navigator.pushNamed(context, '/profile', arguments: true),
        action2Ontap: () => Navigator.pushNamed(context, '/create-catalog'),
        enableSearch: true,
        hintText: 'Cari Proyek...',
        content: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (1 * 0.85),
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            7,
            (index) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/catalog-detail',
                arguments: 0,
              ),
              child: const CatalogCard(),
            ),
          ),
        ),
      ),
    );
  }
}
