import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - (24 * 2) - 16) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColor.grey_2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset('assets/images/default-picture.png',
                fit: BoxFit.cover,
                height:
                    (MediaQuery.of(context).size.width - (24 * 2) - 16) / 2 -
                        50),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logam Lembaran',
                  style: SJATextStyle.titleS(),
                ),
                const SizedBox(height: 2),
                Text(
                  'Ukuran: 2x4m\nKetebalan: 3mm\nStok: 10 Buah',
                  style: SJATextStyle.bodyS(
                    color: AppColor.grey_1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
