import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class InventoryRequestFormPage extends StatefulWidget {
  const InventoryRequestFormPage({super.key});

  @override
  State<InventoryRequestFormPage> createState() =>
      _InventoryRequestFormPageState();
}

class _InventoryRequestFormPageState extends State<InventoryRequestFormPage> {
  String jumlah = '', alasan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              //TODO: JUMLAH JADINYA PERLU GA?
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColor.grey_2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/default-picture.png',
                        width: 135,
                        height: 109,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        'Logam Lembaran',
                        style: SJATextStyle.titleS(),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ukuran: 2x4 m',
                        style: SJATextStyle.bodyS(),
                      ),
                      Text(
                        'ketebalan: 3 mm',
                        style: SJATextStyle.bodyS(),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              SJATextField(
                label: 'Jumlah',
                prefixIcon: 'number',
                onChanged: (value) => setState(() {
                  jumlah = value;
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SJATextField(
                label: 'Alasan',
                prefixIcon: 'note',
                maxLines: 4,
                onChanged: (value) => setState(() {
                  alasan = value;
                }),
              ),
              const SizedBox(
                height: 64,
              ),
              SJAButton(
                label: 'Ajukan',
                type: (jumlah == '' || alasan == '')
                    ? SJAButtonStyle.disabled
                    : SJAButtonStyle.regular,
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => SJAPopUp(
                    text:
                        'Apakah anda yakin ingin mengajukan penggunaan bahan baku ini?',
                    yaOnTap: () {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 3;
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
      title: const Text('Pengajuan Bahan Baku'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      leading: GestureDetector(
        onTap: () {
          //TODO: KALO DIBACK DIA STATUSBARNYA JADI TRANSPARANT DI HALAMAN BACKNYA
          Navigator.pop(context);
        },
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
