import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suma_jaya_anugerah/features/Catalog/presentation/pages/catalog.dart';
import 'package:suma_jaya_anugerah/features/Inventory/presentation/pages/inventory_admin.dart';
import 'package:suma_jaya_anugerah/features/Orders/presentation/pages/order.dart';
import 'package:suma_jaya_anugerah/features/Tools/presentation/pages/tools_admin.dart';
import 'package:suma_jaya_anugerah/features/User/presentation/pages/staff.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_color.dart';
import 'package:suma_jaya_anugerah/features/shared/theme/app_text_style.dart';

class NavAdmin extends StatefulWidget {
  const NavAdmin({super.key});

  @override
  State<NavAdmin> createState() => _NavAdminState();
}

class _NavAdminState extends State<NavAdmin> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    CatalogPage(),
    StaffPage(),
    OrderPage(),
    ToolsAdminPage(),
    InventoryAdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.blue_2,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? AppColor.yellow
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  SvgPicture.asset(
                    'assets/icons/ic-nav-home-${_selectedIndex == 0 ? '1' : '0'}.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? AppColor.yellow
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  SvgPicture.asset(
                    'assets/icons/ic-user-filled.svg',
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        _selectedIndex == 1 ? AppColor.yellow : AppColor.white,
                        BlendMode.srcIn),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Staff',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2
                          ? AppColor.yellow
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  SvgPicture.asset(
                    'assets/icons/ic-nav-order-${_selectedIndex == 2 ? '1' : '0'}.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 3
                          ? AppColor.yellow
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  SvgPicture.asset(
                    'assets/icons/ic-nav-tools-${_selectedIndex == 3 ? '1' : '0'}.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Alat',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Column(
                children: [
                  Container(
                    width: 32,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 4
                          ? AppColor.yellow
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  SvgPicture.asset(
                    'assets/icons/ic-nav-inventory-${_selectedIndex == 4 ? '1' : '0'}.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            label: 'Bahan',
          ),
        ],
        unselectedItemColor: AppColor.white,
        selectedItemColor: AppColor.yellow,
        unselectedLabelStyle: SJATextStyle.bodyS(),
        selectedLabelStyle: SJATextStyle.bodyS(),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
