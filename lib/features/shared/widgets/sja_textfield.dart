import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class SJATextField extends StatefulWidget {
  final String? label;
  final String? prefixIcon;
  final SJATextFieldType? variant;
  const SJATextField({
    super.key,
    this.label,
    this.variant,
    this.prefixIcon,
  });

  @override
  State<SJATextField> createState() => _SJATextFieldState();
}

class _SJATextFieldState extends State<SJATextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    late Widget textfield;

    void toggleShowPassword() {
      setState(() {
        showPassword = !showPassword;
      });
    }

    if (widget.variant == SJATextFieldType.iconInside) {
      textfield = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(
                  widget.label ?? '',
                  style: SJATextStyle.bodyM(),
                )
              : const SizedBox(),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignInside,
                color: AppColor.grey_2,
              ),
            ),
            child: Row(
              children: [
                widget.prefixIcon == null
                    ? const SizedBox()
                    : SvgPicture.asset(
                        'assets/icons/ic-${widget.prefixIcon}.svg',
                        width: 24,
                        height: 24,
                      ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    style: SJATextStyle.bodyS(),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (widget.variant == SJATextFieldType.password) {
      textfield = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(
                  widget.label ?? '',
                  style: SJATextStyle.bodyM(),
                )
              : const SizedBox(),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                strokeAlign: BorderSide.strokeAlignInside,
                color: AppColor.grey_2,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic-password.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    obscureText: showPassword,
                    style: SJATextStyle.bodyS(),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    toggleShowPassword();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/ic-${!showPassword ? 'show' : 'hide'}.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      //TODO: INSIDE ICON TEXTFIELD VARIANT
    }

    return textfield;
  }
}

enum SJATextFieldType {
  iconInside,
  iconOutside,
  password,
}
