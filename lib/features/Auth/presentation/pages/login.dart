import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //TITLE
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Masuk',
                    style: SJATextStyle.titleL(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Selamat datang di aplikasi administrasi\nPT. Suma Jaya Anugerah',
                    style: SJATextStyle.bodyS(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              //Form
              Column(
                children: [
                  SJATextField(
                    variant: SJATextFieldType.iconInside,
                    label: 'Username',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
