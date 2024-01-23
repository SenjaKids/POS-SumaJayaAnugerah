import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/widgets/tool_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class ToolsAdminPage extends StatelessWidget {
  const ToolsAdminPage({super.key});

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
        pageTitle: 'Peralatan',
        action1: 'add',
        action2: 'history',
        action3: 'notification',
        action1OnTap: () => Navigator.pushNamed(context, '/create-tool'),
        action3Ontap: () => Navigator.pushNamed(context, '/tools-request'),
        enableSearch: true,
        hintText: 'Cari Peralatan...',
        content: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (1 * 0.85),
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            11,
            (index) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                '/tools-details-admin',
              ),
              child: const ToolCard(),
            ),
          ),
        ),
      ),
    );
  }
}
