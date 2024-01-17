import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class TaskReportPage extends StatefulWidget {
  const TaskReportPage({super.key});

  @override
  State<TaskReportPage> createState() => _TaskReportPageState();
}

class _TaskReportPageState extends State<TaskReportPage> {
  String report = '';
  @override
  Widget build(BuildContext context) {
    DateTime currDate = DateTime.now();

    String currDateFormatted = DateFormat('dd MMM yyyy').format(currDate);

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Tanggal Diberikan: ',
                  style: SJATextStyle.bodyM(color: AppColor.grey_1),
                  children: <TextSpan>[
                    TextSpan(
                      text: '20 Nov 2023',
                      style: SJATextStyle.bodyM(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Tanggal Selesai: ',
                  style: SJATextStyle.bodyM(color: AppColor.grey_1),
                  children: <TextSpan>[
                    TextSpan(
                      text: currDateFormatted,
                      style: SJATextStyle.bodyM(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SJATextField(
                label: 'Isi Laporan',
                prefixIcon: 'note',
                maxLines: 6,
                onChanged: (value) => setState(() {
                  report = value;
                }),
              ),
              const SizedBox(height: 48),
              SJAButton(
                label: 'Simpan',
                type: report == ''
                    ? SJAButtonStyle.disabled
                    : SJAButtonStyle.regular,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SJAPopUp(
                      text: 'Apakah anda yakin ingin menyelesaikan tugas ini?',
                      yaOnTap: () {
                        int count = 0;
                        Navigator.popUntil(context, (route) {
                          return count++ == 3;
                        });
                      }),
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
      title: const Text('Detail Tugas'),
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
