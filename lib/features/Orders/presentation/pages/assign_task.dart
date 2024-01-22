import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class AssignTaskPage extends StatefulWidget {
  const AssignTaskPage({super.key});

  @override
  State<AssignTaskPage> createState() => _AssignTaskPageState();
}

class _AssignTaskPageState extends State<AssignTaskPage> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Pesanan ',
                  style: SJATextStyle.bodyM(),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ORD3200012',
                      style: SJATextStyle.titleS(color: AppColor.blue_2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Tugas 1: Pembuatan Bagian A',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: SJATextStyle.titleL(),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Deadline: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text: '18 Nov 2024',
                          style: SJATextStyle.bodyM(),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Deskripsi: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute',
                          style: SJATextStyle.bodyM(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SJATextField(
                label: 'Nama Staff',
                prefixIcon: 'user-filled',
                onChanged: (value) => setState(() {
                  name = value;
                }),
              ),
              const SizedBox(height: 48),
              SJAButton(
                label: 'Simpan',
                type: name == ''
                    ? SJAButtonStyle.disabled
                    : SJAButtonStyle.regular,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SJAPopUp(
                    text:
                        'Apakah anda yakin ingin menyimpan penyerahan tugas ini?',
                    yaOnTap: () {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Penyerahan Tugas'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              'assets/icons/ic-chev.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                AppColor.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
