import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SJAMenuPage(
      pageTitle: 'Staff',
      action1: 'add',
      enableSearch: true,
      hintText: 'Cari nama staff...',
      content: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/staff-detail'),
                child: const SJACard(
                  title: 'Saiful Jamiladi',
                  image: 'default-picture.png',
                  imageBorderRadius: 100,
                  description: 'Tukang Las',
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: 3),
    );
  }
}
