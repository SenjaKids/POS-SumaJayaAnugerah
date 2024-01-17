import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class ToolsStaffPage extends StatelessWidget {
  const ToolsStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SJAMenuPage(
      pageTitle: 'Alat Dipinjam',
      action1: 'add',
      action1OnTap: () {
        Navigator.pushNamed(context, '/tools-request-form');
      },
      content: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/tools-details-staff',
              arguments: 0),
          child: SJACard(
            image: 'default-picture.png',
            title: 'Bor Makita',
            description: 'Sejak: 12 Nov 2023',
            topLabel: 'Dipinjam',
            topLabelColor: AppColor.yellow,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/tools-details-staff',
              arguments: 1),
          child: SJACard(
            image: 'default-picture.png',
            title: 'Gunting Profesional Tajam',
            description: 'Dikembalikan: 20 Sep 2023',
            topLabel: 'Dikembalikan',
            topLabelColor: AppColor.blue_3,
          ),
        ),
      ]),
      // content: ListView.separated(
      //   padding: EdgeInsets.zero,
      //   shrinkWrap: true,
      //   itemCount: 2,
      //   separatorBuilder: (context, index) => const SizedBox(height: 8),
      //   itemBuilder: (context, index) => SJACard(
      //     image: 'default-picture.png',
      //     title: 'Bor Makita',
      //     description: 'Sejak: 12 Nov 2023',
      //     topLabel: 'Dipinjam',
      //     topLabelColor: AppColor.yellow,
      //   ),
      // ),
    );
  }
}
