import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';

class SJALabel extends StatelessWidget {
  final String text;
  final Color color;
  const SJALabel({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 8,
          color: AppColor.white,
        ),
      ),
    );
  }
}
