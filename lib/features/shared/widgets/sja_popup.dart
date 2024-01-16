import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';

class SJAPopUp extends StatelessWidget {
  final String text;
  final GestureTapCallback? yaOnTap;
  final GestureTapCallback? tidakOnTap;
  const SJAPopUp(
      {super.key, required this.text, this.yaOnTap, this.tidakOnTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      backgroundColor: AppColor.white,
      surfaceTintColor: AppColor.white,
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: SJATextStyle.subheadM(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SJAButton(
                      label: 'Ya',
                      type: SJAButtonStyle.warning,
                      onTap: yaOnTap,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SJAButton(
                      label: 'Tidak',
                      type: SJAButtonStyle.regular,
                      onTap: tidakOnTap ?? () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
