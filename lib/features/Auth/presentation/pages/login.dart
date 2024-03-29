import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    void validateLogin() {
      if (email == "staff@gmail.com") {
        Navigator.popAndPushNamed(context, '/nav-staff');
      } else if (email == "admin@gmail.com") {
        Navigator.popAndPushNamed(context, '/nav-admin');
      } else {}
    }

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
              const SizedBox(height: 64),
              //FORM LOGIN
              Column(
                children: [
                  SJATextField(
                    variant: SJATextFieldType.iconInside,
                    label: 'Email',
                    prefixIcon: 'user',
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                  ),
                  const SizedBox(height: 16),
                  const SJATextField(
                    variant: SJATextFieldType.password,
                    label: 'Password',
                  ),
                  const SizedBox(height: 40),
                  SJAButton(
                    label: 'Masuk',
                    onTap: () => validateLogin(),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              //INFORMASI LUPA SANDI
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColor.grey_2,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Informasi',
                        style: SJATextStyle.titleS(),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Divider(
                          color: AppColor.grey_2,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Jika terjadi masalah seperti lupa kata sandi, tidak dapat masuk, dll. Mohon hubungi atasan lewat whatsapp.',
                    textAlign: TextAlign.center,
                    style: SJATextStyle.bodyS(),
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
