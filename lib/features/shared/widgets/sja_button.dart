import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class SJAButton extends StatelessWidget {
  final String label;
  final SJAButtonStyle? type;
  const SJAButton({super.key, required this.label, this.type});

  @override
  Widget build(BuildContext context) {
    late Color color;

    if (type == SJAButtonStyle.disabled) {
      color = AppColor.grey_1;
    } else if (type == SJAButtonStyle.warning) {
      color = AppColor.red;
    } else {
      color = AppColor.blue_2;
    }

    return Container(
      alignment: Alignment.center,
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.maxFinite,
      child: Text(
        label,
        style: SJATextStyle.subheadM(color: AppColor.white),
      ),
    );
  }
}

enum SJAButtonStyle {
  regular,
  disabled,
  warning,
}
