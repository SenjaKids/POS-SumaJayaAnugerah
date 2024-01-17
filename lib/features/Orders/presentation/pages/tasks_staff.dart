import 'package:flutter/material.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/widgets/task_card.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class TasksStaffPage extends StatelessWidget {
  const TasksStaffPage({super.key});

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
        _dikerjakanTab(),
        _selesaiTab(),
      ],
    );
  }

  Widget _dikerjakanTab() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/task-details-staff',
            arguments: false),
        child: const TaskCard(
          title: 'Pengelasan Besi 1029',
          subTitle: 'Deadline: 27 Feb 2024',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute',
        ),
      ),
    );
  }

  Widget _selesaiTab() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/task-details-staff',
            arguments: true),
        child: const TaskCard(
          title: 'Pemasangan Balok Besi PT. Jaya',
          subTitle: 'Selesai pada 20 Des 2023',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute',
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blue_2,
      title: const Text('List Tugas'),
      centerTitle: true,
      titleTextStyle: SJATextStyle.titleM(color: AppColor.white),
      automaticallyImplyLeading: false,
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
              'Dikerjakan',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Selesai',
            ),
          ),
        ],
      ),
    );
  }
}
