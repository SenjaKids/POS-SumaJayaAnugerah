import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class HomeStaffPage extends StatelessWidget {
  const HomeStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue_2,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(90, 45),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'assets/images/bg-decoration.svg',
                width: 294,
                height: 294,
              ),
            ),
          ),
          Column(
            children: [
              //TOP BLUE CONTAINER
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PT. Suma Jaya Anugerah',
                            style: SJATextStyle.titleM(color: AppColor.white),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/profile'),
                            child: SvgPicture.asset(
                              'assets/icons/ic-user-filled.svg',
                              colorFilter: ColorFilter.mode(
                                  AppColor.white, BlendMode.srcIn),
                              width: 24,
                              height: 24,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/default-profile.png',
                              height: 64,
                              width: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang,\nSaiful Jamiladi',
                                style:
                                    SJATextStyle.bodyL(color: AppColor.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 21),
                    ],
                  ),
                ),
              ),
              //BOTTOM WHITE CONTAINER
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 28),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic-task.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Dalam Pengerjaan',
                              style: SJATextStyle.titleM(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Lihat Semua',
                            style: SJATextStyle.bodyS(color: AppColor.blue_2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic-tools.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Sedang Dipinjam',
                              style: SJATextStyle.titleM(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Lihat Semua',
                            style: SJATextStyle.bodyS(color: AppColor.blue_2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
