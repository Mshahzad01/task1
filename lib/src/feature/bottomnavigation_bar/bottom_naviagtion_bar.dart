import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/asset_string.dart';
import 'package:task1/src/constant/textstyle.dart';
import 'package:task1/src/feature/booking/screen/booking_details_screen.dart';
import 'package:task1/src/feature/booking/screen/booking_screen.dart';
import 'package:task1/src/feature/mapview/model/quotes_model.dart';
import 'package:task1/src/feature/mapview/widgets/appbarwidget.dart';
import 'package:task1/src/feature/mapview/widgets/drawer_widget.dart';
import 'package:task1/src/feature/message/screen/message_screen.dart';

import '../dashbord/screen/dashborad_screen.dart';
import '../mapview/screen/map_view_screen.dart';


class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 4;

  final List<Widget> _screens = [
    DashboardScreen(),
    MapViewscreen(),
    BookingScreen(),
        BookingScreen(),
  //BookingDetailScreen(),
    MessageScreen(),
  
  ];

  @override
  Widget build(BuildContext context) {
    final List<QuotesModel> quteinfo = quotesinfo;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: Appbarwidget(),

      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(child: _screens[_currentIndex]),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: .0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              color: Colors.black.withOpacity(0.8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quotes", style: AppTextStyles.appbartitle),

                      Text(
                        "Potential Clients",
                        style: AppTextStyles.appbartitle,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${quteinfo[0].sent}  sent",
                        style: AppTextStyles.role,
                      ),

                      SizedBox(width: 15),

                      Text("${quteinfo[0].won}  won", style: AppTextStyles.won),

                      Spacer(),
                      Text(
                        "${quteinfo[0].potentialclint}",
                        style: AppTextStyles.appbartitle,
                      ),

                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.8),
          ),

          SizedBox(height: 02),
        ],
      ),

      bottomNavigationBar: CustomBottombar(),
    );
  }



Widget CustomBottombar() {
  return SalomonBottomBar(
    itemPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    backgroundColor: Colors.black.withOpacity(0.8),
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() => _currentIndex = index);
    },
    items: [
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          AssetString.bottomone,
          height: 22,
          width: 22,
          color: _currentIndex == 0 ? AppColors.bottombarcolor : Colors.grey,
        ),
        title: Text("Dashboard", style: AppTextStyles.bottombar),
        selectedColor: AppColors.bottombarcolor,
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          AssetString.bottomtwo,
          height: 24,
          width: 24,
          color: _currentIndex == 1 ? AppColors.bottombarcolor : Colors.grey,
        ),
        title: Text("MapView", style: AppTextStyles.bottombar),
        selectedColor: AppColors.bottombarcolor,
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          AssetString.bottomThree,
          height: 24,
          width: 24,
          color: _currentIndex == 2 ? AppColors.bottombarcolor : Colors.grey,
        ),
        title: Text("Job", style: AppTextStyles.bottombar),
        selectedColor: AppColors.bottombarcolor,
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          AssetString.bottomfoure,
          height: 24,
          width: 24,
          color: _currentIndex == 3 ? AppColors.bottombarcolor : Colors.grey,
        ),
        title: Text("Booking", style: AppTextStyles.bottombar),
        selectedColor: AppColors.bottombarcolor,
      ),
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          AssetString.bottomfive,
          height: 24,
          width: 24,
          color: _currentIndex == 4 ? AppColors.bottombarcolor : Colors.grey,
        ),
        title: Text("Request", style: AppTextStyles.bottombar),
        selectedColor: AppColors.bottombarcolor,
      ),
    ],
  );
}
}
