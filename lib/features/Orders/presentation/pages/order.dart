import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_card.dart';
import 'package:suma_jaya_anugerah/features/shared/widgets/sja_menu_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SJAMenuPage(
      pageTitle: 'Pesanan',
      action1: 'add',
      action1OnTap: () => Navigator.pushNamed(context, '/create-order'),
      enableSearch: true,
      hintText: 'Cari pesanan...',
      content: Column(
        children: [
          SJACard(
            title: 'Pembuatan besi baja untuk meja besi bang irawan',
            bottomLabel: 'Belum Dimulai',
            bottomLabelColor: AppColor.red,
            description: 'ORD3200013',
          ),
          const SizedBox(height: 8),
          SJACard(
            title: 'Pesanan bu karta',
            bottomLabel: 'Dikerjakan',
            bottomLabelColor: AppColor.yellow,
            description: 'ORD32D00013',
          ),
          const SizedBox(height: 8),
          SJACard(
            title: 'Pelapisan Kayu mapple12',
            bottomLabel: 'Selesai',
            bottomLabelColor: AppColor.blue_3,
            description: 'ORD3200013',
          ),
        ],
      ),
    );
  }
}
