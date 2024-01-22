import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_button.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_label.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_popup.dart';

class OrderDetailsPage extends StatelessWidget {
  final bool isDone;
  const OrderDetailsPage({super.key, required this.isDone});

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
                'Pengelasan Stainless Steel untuk Meja ukuran 21 meter',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: SJATextStyle.titleL(),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isDone
                      ? RichText(
                          text: TextSpan(
                            text: 'Tanggal Selesai: ',
                            style: SJATextStyle.bodyM(color: AppColor.grey_1),
                            children: <TextSpan>[
                              TextSpan(
                                text: '28 Nov 2023',
                                style: SJATextStyle.bodyM(),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
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
                      text: 'Nama Client: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Christoper B.',
                          style: SJATextStyle.bodyM(),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'No. Telepon Client: ',
                      style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      children: <TextSpan>[
                        TextSpan(
                          text: '081234567890',
                          style: SJATextStyle.bodyM(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Status: ',
                        style: SJATextStyle.bodyM(color: AppColor.grey_1),
                      ),
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
                        'assets/icons/ic-note.svg',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tugas',
                          style: SJATextStyle.titleM(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      isDone
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/create-task'),
                              child: SvgPicture.asset(
                                'assets/icons/ic-add.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    child: SJACard(
                      title: 'Tugas 1: Pembuatan Bagian A',
                      description: 'Deadline: 12 Jan 2024',
                      bottomLabel: isDone ? 'Selesai' : 'Belum Dimulai',
                      bottomLabelColor: isDone ? AppColor.blue_3 : AppColor.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SJACard(
                    title: 'Tugas 2: Pembuatan Bagian B',
                    description: 'Deadline: 14 Jan 2024',
                    bottomLabel: isDone ? 'Selesai' : 'Dikerjakan',
                    bottomLabelColor:
                        isDone ? AppColor.blue_3 : AppColor.yellow,
                  ),
                ],
              ),
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
                              'Apakah anda yakin ingin membatalkan pesanan ini?',
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
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Detail Pesanan'),
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
