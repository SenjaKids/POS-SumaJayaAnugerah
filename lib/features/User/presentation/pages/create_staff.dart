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

class CreateStaffFormPage extends StatefulWidget {
  const CreateStaffFormPage({super.key});

  @override
  State<CreateStaffFormPage> createState() => _CreateStaffFormPageState();
}

class _CreateStaffFormPageState extends State<CreateStaffFormPage> {
  String staffName = '',
      gender = '',
      birthplace = '',
      birthday = '',
      phone = '',
      email = '',
      role = '',
      password = '';

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 43),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => pickImage(),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey_2, width: 1),
                    borderRadius: BorderRadius.circular(999)),
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: pickedImage != null
                            ? Image.file(
                                pickedImage!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/default-profile.png',
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic-camera.svg',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SJATextField(
                    label: 'Nama',
                    prefixIcon: 'user-filled',
                    onChanged: (value) => setState(() {
                      staffName = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Jenis Kelamin',
                    prefixIcon: 'gender',
                    onChanged: (value) => setState(() {
                      gender = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Tempat Lahir',
                    prefixIcon: 'location',
                    onChanged: (value) => setState(() {
                      birthplace = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Tanggal Lahir',
                    prefixIcon: 'calendar',
                    variant: SJATextFieldType.datepicker,
                    onChanged: (value) => setState(() {
                      birthday = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'No. Telepon',
                    prefixIcon: 'phone',
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => setState(() {
                      phone = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Email',
                    prefixIcon: 'email',
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Role',
                    prefixIcon: 'title',
                    onChanged: (value) => setState(() {
                      role = value;
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SJATextField(
                    label: 'Password',
                    prefixIcon: 'password',
                    onChanged: (value) => setState(() {
                      password = value;
                    }),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SJAButton(
                    label: 'Simpan',
                    type: (staffName == '' ||
                            gender == '' ||
                            birthplace == '' ||
                            birthday == '' ||
                            phone == '' ||
                            email == '' ||
                            role == '' ||
                            password == '')
                        ? SJAButtonStyle.disabled
                        : SJAButtonStyle.regular,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SJAPopUp(
                        text: 'Apakah anda yakin ingin membuat akun staff ini?',
                        yaOnTap: () {
                          int count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
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
      title: const Text('Tambah Staff'),
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
