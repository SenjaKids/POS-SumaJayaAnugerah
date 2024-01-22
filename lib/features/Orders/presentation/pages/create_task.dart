import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class CreateTaskFormPage extends StatefulWidget {
  const CreateTaskFormPage({super.key});

  @override
  State<CreateTaskFormPage> createState() => _CreateTaskFormPageState();
}

class _CreateTaskFormPageState extends State<CreateTaskFormPage> {
  String taskName = '', deadline = '', deskripsi = '', attachment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              SJATextField(
                label: 'Judul Tugas',
                prefixIcon: 'task',
                onChanged: (value) => setState(() {
                  taskName = value;
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SJATextField(
                label: 'Deskripsi',
                prefixIcon: 'note',
                maxLines: 4,
                onChanged: (value) => setState(() {
                  deskripsi = value;
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SJATextField(
                label: 'Deadline',
                prefixIcon: 'day',
                variant: SJATextFieldType.datepicker,
                onChanged: (value) => setState(() {
                  deadline = value;
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SJATextField(
                label: 'Lampiran',
                prefixIcon: 'attachment',
                onChanged: (value) => setState(() {
                  attachment = value;
                }),
              ),
              const SizedBox(
                height: 64,
              ),
              SJAButton(
                label: 'Simpan',
                type: (taskName == '' ||
                        deadline == '' ||
                        deskripsi == '' ||
                        attachment == '')
                    ? SJAButtonStyle.disabled
                    : SJAButtonStyle.regular,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SJAPopUp(
                    text: 'Apakah anda yakin ingin membuat tugas baru ini?',
                    yaOnTap: () {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Buat Tugas'),
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
