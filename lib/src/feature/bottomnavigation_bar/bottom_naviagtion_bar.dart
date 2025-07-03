import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:task1/src/constant/app_color.dart';

import '../dashbord/screen/dashborad_screen.dart';
import '../mapview/screen/map_view_screen.dart';
import '../mapview/screen/settingscreen.dart';






class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    MapViewscreen(),
    DashboardScreen(),
    Settingscreen(),
    Settingscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SalomonBottomBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: [
            SalomonBottomBarItem(
              icon: SvgPicture.asset("assets/icon/bottom1.svg"),
              title: const Text("Dashboard"),
              selectedColor: AppColors.bottombarcolor,
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset("assets/icon/bottom2.svg"),
              title: const Text("MapView"),
              selectedColor: AppColors.bottombarcolor,
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset("assets/icon/bottom3.svg"),
              title: const Text("Request"),
              selectedColor: AppColors.bottombarcolor,
            ),

            SalomonBottomBarItem(
              icon: SvgPicture.asset("assets/icon/bottom4.svg"),
              title: const Text("Booking"),
              selectedColor: AppColors.bottombarcolor,
            ),
          ],
        ),
      ),
    );
  }
}
