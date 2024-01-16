import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';

class ToolsDetailsStaffPage extends StatelessWidget {
  final int borrowStatus;
  const ToolsDetailsStaffPage({
    super.key,
    required this.borrowStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () => Navigator.pop(context),
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
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Status: ',
                    style: SJATextStyle.bodyM(color: AppColor.grey_1),
                    children: <TextSpan>[
                      TextSpan(
                        text: borrowStatus == 0 ? 'Dipinjam' : 'Dikembalikan',
                        style: SJATextStyle.titleS2(
                            color: borrowStatus == 0
                                ? AppColor.red
                                : AppColor.blue_2),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Tgl Peminjaman: ',
                    style: SJATextStyle.bodyM(color: AppColor.grey_1),
                    children: <TextSpan>[
                      TextSpan(
                        text: '26 Sep 2023',
                        style: SJATextStyle.bodyM(),
                      ),
                    ],
                  ),
                ),
                borrowStatus == 1
                    ? RichText(
                        text: TextSpan(
                          text: 'Tgl Pengembalian: ',
                          style: SJATextStyle.bodyM(color: AppColor.grey_1),
                          children: <TextSpan>[
                            TextSpan(
                              text: '28 Sep 2023',
                              style: SJATextStyle.bodyM(),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 48,
                ),
                borrowStatus == 0
                    ? SJAButton(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => SJAPopUp(
                              text:
                                  'Apakah anda yakin ingin mengembalikan alat ini?',
                              yaOnTap: () {
                                int count = 0;
                                Navigator.popUntil(context, (route) {
                                  return count++ == 2;
                                });
                              }),
                        ),
                        label: 'Kembalikan',
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
