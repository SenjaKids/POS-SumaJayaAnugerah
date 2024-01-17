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
      itemBuilder: (context, index) => const TaskCard(),
    );
  }

  Widget _selesaiTab() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => const TaskCard(),
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
