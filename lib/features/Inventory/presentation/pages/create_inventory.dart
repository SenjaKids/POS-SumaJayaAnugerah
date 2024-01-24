import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_textfield.dart';

class CreateInventoryFormPage extends StatefulWidget {
  const CreateInventoryFormPage({super.key});

  @override
  State<CreateInventoryFormPage> createState() =>
      _CreateInventoryFormPageState();
}

class _CreateInventoryFormPageState extends State<CreateInventoryFormPage> {
  String inventoryName = '',
      description = '',
      qty = '',
      size = '',
      ketebalan = '';

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => pickImage(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 5 / 3.5,
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/default-picture.png',
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                  ),
                  AspectRatio(
                    aspectRatio: 5 / 3.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white
                            .withOpacity(pickedImage != null ? .6 : 0),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic-camera.svg',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tekan untuk mengganti gambar',
                        style: SJATextStyle.subheadM(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SJATextField(
                    label: 'Nama Bahan',
                    prefixIcon: 'material',
                    onChanged: (value) => setState(() {
                      inventoryName = value;
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
                      description = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Stok',
                    prefixIcon: 'number',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      qty = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Ukuran',
                    prefixIcon: 'title',
                    onChanged: (value) => setState(() {
                      size = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Ketebalan',
                    prefixIcon: 'title',
                    onChanged: (value) => setState(() {
                      ketebalan = value;
                    }),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SJAButton(
                    label: 'Ajukan',
                    type: (inventoryName == '' ||
                            description == '' ||
                            qty == '' ||
                            size == '' ||
                            ketebalan == '')
                        ? SJAButtonStyle.disabled
                        : SJAButtonStyle.regular,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SJAPopUp(
                        text:
                            'Apakah anda yakin ingin menambah data bahan ini?',
                        yaOnTap: () {
                          int count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Tambah Bahan'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      leading: GestureDetector(
        onTap: () {
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

  Future pickImage() async {
    try {
      print('picking image');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // print('image');
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => pickedImage = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
