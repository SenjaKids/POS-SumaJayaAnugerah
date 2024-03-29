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

class EditCatalogFormPage extends StatefulWidget {
  const EditCatalogFormPage({super.key});

  @override
  State<EditCatalogFormPage> createState() => _EditCatalogFormPageState();
}

class _EditCatalogFormPageState extends State<EditCatalogFormPage> {
  String projectName = 'Proyek membuat besi';
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco';

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
                    label: 'Nama Proyek',
                    prefixIcon: 'task',
                    onChanged: (value) => setState(() {
                      projectName = value;
                    }),
                    initialValue: projectName,
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
                    initialValue: description,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  SJAButton(
                    label: 'Ajukan',
                    type: (projectName == '' || description == '')
                        ? SJAButtonStyle.disabled
                        : SJAButtonStyle.regular,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SJAPopUp(
                        text:
                            'Apakah anda yakin ingin menyimpan perubahan proyek ini?',
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
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Edit Proyek'),
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
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => pickedImage = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
