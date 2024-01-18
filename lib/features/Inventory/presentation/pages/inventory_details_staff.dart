import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';

class InventoryDetailsStaffPage extends StatelessWidget {
  final int pageStatus;
  const InventoryDetailsStaffPage({super.key, required this.pageStatus});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(statusBarColor: AppColor.blue_2),
    // );
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.blue_2,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
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
                        SystemChrome.setSystemUIOverlayStyle(
                          const SystemUiOverlayStyle(
                              statusBarColor: Colors.transparent),
                        );
                        Navigator.pop(context);
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
                        'INV2440018',
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
                    'Logam Lembaran',
                    style: SJATextStyle.titleL(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Divider(color: AppColor.grey_2, height: 1),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      text: 'Ukuran: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text: '2x4 meter',
                          style: SJATextStyle.bodyM(),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Ketebalan: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text: '3mm',
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
                  const SizedBox(height: 8),
                  pageStatus == 0
                      ? RichText(
                          text: TextSpan(
                            text: 'Sisa Stok: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '10 Buah',
                                style: SJATextStyle.titleS2(
                                    color: AppColor.blue_2),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  pageStatus != 0
                      ? RichText(
                          text: TextSpan(
                            text: 'Tanggal Pengajuan: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '22 Nov 2023',
                                style: SJATextStyle.titleS2(
                                    color: AppColor.blue_2),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  pageStatus == 2
                      ? RichText(
                          text: TextSpan(
                            text: 'Tanggal Pengembalian: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '23 Nov 2023',
                                style: SJATextStyle.titleS2(
                                    color: AppColor.blue_2),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  pageStatus == 2
                      ? RichText(
                          text: TextSpan(
                            text: 'Jumlah: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '2 Buah',
                                style: SJATextStyle.titleS2(
                                    color: AppColor.blue_2),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 48,
                  ),
                  pageStatus != 2
                      ? SJAButton(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/inventory-${pageStatus == 0 ? 'request' : 'return'}-form');

                            // SystemChrome.setSystemUIOverlayStyle(
                            //   SystemUiOverlayStyle(statusBarColor: AppColor.red),
                            // );
                          },
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => SJAPopUp(
                          //       text: 'Apakah anda yakin ingin mengembalikan alat ini?',
                          //       yaOnTap: () {
                          //         int count = 0;
                          //         Navigator.popUntil(context, (route) {
                          //           return count++ == 2;
                          //         });
                          //         SystemChrome.setSystemUIOverlayStyle(
                          //           const SystemUiOverlayStyle(
                          //               statusBarColor: Colors.transparent),
                          //         );
                          //       }),
                          // ),
                          label:
                              '${pageStatus == 0 ? 'Pengajuan' : 'Pengembalian'} Bahan Baku',
                        )
                      : const SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
