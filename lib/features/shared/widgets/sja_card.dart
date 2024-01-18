import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_label.dart';

class SJACard extends StatelessWidget {
  final String? image;
  final double? imageBorderRadius;
  final String title;
  final String? description;
  final String? topLabel, bottomLabel;
  final Color? topLabelColor, bottomLabelColor;
  const SJACard({
    super.key,
    this.image,
    this.imageBorderRadius,
    required this.title,
    this.description,
    this.topLabel,
    this.bottomLabel,
    this.topLabelColor,
    this.bottomLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    late Widget card;

    card = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColor.grey_2,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(imageBorderRadius ?? 4),
                  child: Image.asset(
                    'assets/images/$image',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
          SizedBox(width: image != null ? 8 : 0),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: SJATextStyle.titleS(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    topLabel != null
                        ? SJALabel(
                            text: topLabel ?? '',
                            color: topLabelColor ?? AppColor.blue_3)
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        description ?? '',
                        style: SJATextStyle.bodyS(color: AppColor.grey_1),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    bottomLabel != null
                        ? SJALabel(
                            text: bottomLabel!,
                            color: bottomLabelColor ?? AppColor.blue_3)
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/ic-chev.svg',
            width: 24,
            height: 24,
          )
        ],
      ),
    );

    return card;
  }
}

enum SJACardType {
  small,
  big,
}
