import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';

class ToolsRequestHistoryPage extends StatelessWidget {
  const ToolsRequestHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(children: [
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/tools-request-details',
                        arguments: 1),
                    child: const SJACard(
                      title: 'Bor Makita',
                      image: 'default-picture.png',
                      description: 'oleh Saiful Jamiladi, 12 Nov 2024',
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 2),
        ]),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Riwayat Peminjaman Alat'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              'assets/icons/ic-chev.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                AppColor.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
