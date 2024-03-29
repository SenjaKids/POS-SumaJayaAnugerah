import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class SJATextField extends StatefulWidget {
  final String? label, suffixLabel;
  final String? prefixIcon, suffixIcon;
  final String? initialValue;
  final SJATextFieldType? variant;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const SJATextField({
    super.key,
    this.label,
    this.variant,
    this.prefixIcon,
    this.maxLines,
    this.onChanged,
    this.backgroundColor,
    this.hintText,
    this.suffixIcon,
    this.suffixLabel,
    this.inputFormatters,
    this.keyboardType,
    this.initialValue,
  });

  @override
  State<SJATextField> createState() => _SJATextFieldState();
}

class _SJATextFieldState extends State<SJATextField> {
  bool showPassword = false;
  String datePickerValue = '--';
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

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
              color: widget.backgroundColor,
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
                    onChanged: widget.onChanged == null
                        ? null
                        : (value) => widget.onChanged!(value),
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
              color: widget.backgroundColor,
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
      textfield = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.prefixIcon == null
                  ? const SizedBox()
                  : SvgPicture.asset(
                      'assets/icons/ic-${widget.prefixIcon}.svg',
                      width: 20,
                      height: 20,
                    ),
              const SizedBox(width: 4),
              widget.label != null
                  ? Text(
                      widget.label ?? '',
                      style: SJATextStyle.bodyM(),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 4),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.variant == SJATextFieldType.datepicker
                ? () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        datePickerValue = formattedDate;
                      });
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!(datePickerValue);
                    }
                  }
                : null,
            child: Container(
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
                color: widget.backgroundColor,
              ),
              child: Row(
                children: [
                  widget.variant != SJATextFieldType.datepicker
                      ? Expanded(
                          child: TextField(
                            inputFormatters: widget.inputFormatters,
                            style: SJATextStyle.bodyS(),
                            maxLines: widget.maxLines ?? 1,
                            keyboardType: widget.keyboardType,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintStyle:
                                  SJATextStyle.bodyS(color: AppColor.grey_1),
                              hintText: widget.hintText ?? '--',
                            ),
                            controller: _controller,
                            autocorrect: false,
                            enableSuggestions: false,
                            onChanged: widget.onChanged == null
                                ? null
                                : (value) => widget.onChanged!(value),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            datePickerValue,
                            style: SJATextStyle.bodyS(
                                color: datePickerValue == '--'
                                    ? AppColor.grey_1
                                    : null),
                          ),
                        ),
                  const SizedBox(width: 8),
                  widget.suffixIcon != null
                      ? SvgPicture.asset(
                          'assets/icons/ic-${widget.suffixIcon}.svg',
                          width: 24,
                          height: 24,
                        )
                      : const SizedBox(),
                  widget.suffixLabel != null
                      ? Text(
                          widget.suffixLabel!,
                          style: SJATextStyle.bodyS(color: AppColor.grey_1),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return textfield;
  }
}

enum SJATextFieldType {
  iconInside,
  iconOutside,
  password,
  datepicker,
}
