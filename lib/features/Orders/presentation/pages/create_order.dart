import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class CreateOrderFormPage extends StatefulWidget {
  const CreateOrderFormPage({super.key});

  @override
  State<CreateOrderFormPage> createState() => _CreateOrderFormPageState();
}

class _CreateOrderFormPageState extends State<CreateOrderFormPage> {
  String toolName = '', clientName = '', deskripsi = '', clientPhone = '';

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
                label: 'Judul Pesanan',
                prefixIcon: 'task',
                onChanged: (value) => setState(() {
                  toolName = value;
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
                label: 'Nama Client',
                prefixIcon: 'user-filled',
                onChanged: (value) => setState(() {
                  clientName = value;
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SJATextField(
                label: 'No. Telepon Client',
                prefixIcon: 'phone',
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  clientPhone = value;
                }),
              ),
              const SizedBox(
                height: 64,
              ),
              SJAButton(
                label: 'Simpan',
                type: (toolName == '' ||
                        clientName == '' ||
                        deskripsi == '' ||
                        clientPhone == '')
                    ? SJAButtonStyle.disabled
                    : SJAButtonStyle.regular,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SJAPopUp(
                    text: 'Apakah anda yakin ingin membuat pesanan baru ini?',
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
      title: const Text('Buat Pesanan'),
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
