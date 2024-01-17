import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class SJAMenuPage extends StatelessWidget {
  final String pageTitle;
  final String? action1, action2;
  final GestureTapCallback? action1OnTap, action2Ontap;
  final Widget? content;

  const SJAMenuPage(
      {super.key,
      required this.pageTitle,
      this.action1,
      this.action2,
      required this.content,
      this.action1OnTap,
      this.action2Ontap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue_2,
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(-80, -10),
            child: SvgPicture.asset(
              'assets/images/bg-decoration.svg',
              width: 298,
              height: 298,
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        action2 != null
                            ? GestureDetector(
                                onTap: action2Ontap,
                                child: SvgPicture.asset(
                                  'assets/icons/ic-$action2.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      AppColor.white, BlendMode.srcIn),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(width: 12),
                        action1 != null
                            ? GestureDetector(
                                onTap: action1OnTap,
                                child: SvgPicture.asset(
                                  'assets/icons/ic-$action1.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      AppColor.white, BlendMode.srcIn),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        pageTitle,
                        style: SJATextStyle.titleL(color: AppColor.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColor.white),
                  child: content ?? const SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
