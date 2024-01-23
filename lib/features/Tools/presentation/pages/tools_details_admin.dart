import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';

class ToolsDetailsAdminPage extends StatelessWidget {
  const ToolsDetailsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.blue_2),
    );
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.blue_2,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TOP PART
              SafeArea(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(75),
                      ),
                      child: Image.asset(
                        'assets/images/default-picture.png',
                        height: 293,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);

                          SystemChrome.setSystemUIOverlayStyle(
                            const SystemUiOverlayStyle(
                                statusBarColor: Colors.transparent),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.blue_2,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
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
                    ),
                    Transform.translate(
                      offset: const Offset(0, 17),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 7, 24, 7),
                        decoration: BoxDecoration(
                          color: AppColor.blue_2,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                          ),
                        ),
                        child: Text(
                          'BRT12440012',
                          style: SJATextStyle.subheadL(color: AppColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //DETAIL PART
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tacklife 6.7 Amp 3000 SPM Jigsaw tool',
                      style: SJATextStyle.titleL(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Divider(color: AppColor.grey_2, height: 1),
                    const SizedBox(height: 12),
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
                    RichText(
                      text: TextSpan(
                        text: 'Stok: ',
                        style: SJATextStyle.bodyM(color: AppColor.grey_1),
                        children: <TextSpan>[
                          TextSpan(
                            text: '10 buah',
                            style: SJATextStyle.bodyM(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic-user-filled.svg',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Peminjam Aktif',
                            style: SJATextStyle.titleM(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SJACard(
                      title: 'Saiful Jamiladi',
                      description: 'Sejak 12 Nov 2024',
                      image: 'default-profile.png',
                      imageBorderRadius: 100,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    SJAButton(
                      // onTap: () => ,
                      label: 'Ubah Data',
                    ),
                    const SizedBox(height: 16),
                    SJAButton(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => SJAPopUp(
                            text: 'Apakah anda yakin ingin menghapus alat ini?',
                            yaOnTap: () {
                              int count = 0;
                              Navigator.popUntil(context, (route) {
                                return count++ == 2;
                              });
                            }),
                      ),
                      label: 'Hapus',
                      type: SJAButtonStyle.warning,
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
