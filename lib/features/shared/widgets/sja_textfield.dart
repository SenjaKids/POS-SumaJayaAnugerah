import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class SJATextField extends StatelessWidget {
  final String? label;
  final SJATextFieldType? variant;
  const SJATextField({super.key, this.label, this.variant});

  @override
  Widget build(BuildContext context) {
    late Widget textfield;

    if (variant == SJATextFieldType.iconInside) {
      textfield = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label ?? '',
                  style: SJATextStyle.bodyM(),
                )
              : const SizedBox(),
          const SizedBox(height: 4),
          TextField(
            style: SJATextStyle.bodyS(),
            decoration: InputDecoration(
              // prefixIcon: ,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: AppColor.grey_2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: AppColor.grey_2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: AppColor.grey_2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: AppColor.grey_2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: AppColor.grey_2,
                ),
              ),
            ),
          ),
        ],
      );
    } else {}

    return textfield;
  }
}

enum SJATextFieldType {
  iconInside,
  iconOutside,
}
