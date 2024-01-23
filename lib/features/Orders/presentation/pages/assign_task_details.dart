import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_label.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';

class AssignTaskDetailsPage extends StatelessWidget {
  final bool isDone;
  const AssignTaskDetailsPage({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Pesanan ',
                  style: SJATextStyle.bodyM(),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ORD3200012',
                      style: SJATextStyle.titleS(color: AppColor.blue_2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Tugas 1: Pembuatan Bagian A',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: SJATextStyle.titleL(),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/default-profile.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Saiful Jamiladi',
                    style: SJATextStyle.bodyS(),
                  ),
                  const SizedBox(width: 8),
                  SJALabel(
                      text: isDone ? 'Selesai' : 'Dikerjakan',
                      color: isDone ? AppColor.blue_3 : AppColor.yellow)
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic-document.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Detail Tugas',
                      style: SJATextStyle.titleM(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'ID Tugas: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Tugas-2001223',
                                style: SJATextStyle.bodyM(),
                              ),
                            ],
                          ),
                        ),
                        isDone
                            ? const SizedBox()
                            : RichText(
                                text: TextSpan(
                                  text: 'Deadline: ',
                                  style: SJATextStyle.bodyM(
                                      color: AppColor.grey_1),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '30 Nov 2023',
                                      style: SJATextStyle.bodyM(),
                                    ),
                                  ],
                                ),
                              ),
                        RichText(
                          text: TextSpan(
                            text: 'Tanggal Diserahkan: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '28 Nov 2023',
                                style: SJATextStyle.bodyM(),
                              ),
                            ],
                          ),
                        ),
                        isDone
                            ? RichText(
                                text: TextSpan(
                                  text: 'Tanggal Selesai: ',
                                  style: SJATextStyle.bodyM(
                                      color: AppColor.grey_1),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '29 Nov 2023',
                                      style: SJATextStyle.bodyM(),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: isDone ? 24 : 0),
              isDone
                  ? Row(
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
                            'Laporan',
                            style: SJATextStyle.titleM(),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(height: isDone ? 8 : 0),
              isDone
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea ',
                            style: SJATextStyle.bodyM(),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 48),
              isDone
                  ? const SizedBox()
                  : SJAButton(
                      label: 'Batalkan',
                      type: SJAButtonStyle.warning,
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => SJAPopUp(
                          text:
                              'Apakah anda yakin ingin membatalkan penugasan ini?',
                          yaOnTap: () {
                            int count = 0;
                            Navigator.popUntil(
                              context,
                              (route) {
                                return count++ == 2;
                              },
                            );
                          },
                        ),
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
      title: const Text('Detail Tugas Diserahkan'),
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
