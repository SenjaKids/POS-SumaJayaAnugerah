import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';

class InventoryRequestHistoryPage extends StatefulWidget {
  const InventoryRequestHistoryPage({super.key});

  @override
  State<InventoryRequestHistoryPage> createState() =>
      _InventoryRequestHistoryPageState();
}

class _InventoryRequestHistoryPageState
    extends State<InventoryRequestHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      children: [
        _diajukanTab(),
        _dikembalikanTab(),
      ],
    );
  }

  Widget _diajukanTab() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      itemCount: 2,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/inventory-details-staff',
          arguments: 1,
        ),
        child: const SJACard(
          title: 'Logam Lembaran',
          image: 'default-picture.png',
          description: '12 Nov 2023 • 4 Buah',
        ),
      ),
    );
  }

  Widget _dikembalikanTab() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/inventory-details-staff',
          arguments: 2,
        ),
        child: const SJACard(
          title: 'Logam Lembaran',
          image: 'default-picture.png',
          description: '27 Sep 2023 • 2 Buah',
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('Riwayat Pengajuan Bahan'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      leading: GestureDetector(
        onTap: () {
          //TODO: KALO DIBACK DIA STATUSBARNYA JADI TRANSPARANT DI HALAMAN BACKNYA
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
      bottom: TabBar(
        indicatorColor: AppColor.yellow,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColor.white,
        labelColor: AppColor.yellow,
        unselectedLabelStyle: SJATextStyle.bodyM(),
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Diajukan',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Dikembalikan',
            ),
          ),
        ],
      ),
    );
  }
}
