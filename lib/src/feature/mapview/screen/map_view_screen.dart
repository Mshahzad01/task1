import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/feature/mapview/model/appbarmodel.dart';


import 'package:task1/src/feature/mapview/widgets/dayinfo_widget.dart';

import '../widgets/appoiment_widget.dart';
import '../widgets/appbarwidget.dart';
import '../widgets/drawer_widget.dart';
import 'googlemap.dart';

class MapViewscreen extends StatefulWidget {
  const MapViewscreen({super.key});

  @override
  State<MapViewscreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<MapViewscreen> {
  @override
  Widget build(BuildContext context) {
    // dumy data for appbar
    final infoMap = {'earnings': '246.54', 'totalClients': '256'};

    final infoModel = AppBarInfoModel.fromMap(infoMap);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),

      appBar: Appbarwidget(info: infoModel),
      body: Stack(
        children: [
          //Map integration
          WorldMapWidget(),
         

         //date mont  implemnt 
          Positioned(
            top: 100,
            left: 05,
            right: 05,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 65,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Color(0xff272727).withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("All", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 05),

               //   Expanded(child: const AutoMonthUpdateScroller()),

                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/icon/power-01.svg"),
                  ),
                ],
              ),
            ),
          ),

          const AppointmentListWidget(),

       

          /// Bottom Info Bar
          Positioned(
            bottom: 05,
            left: 0,
            right: 0,
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "IDN Pro      ",
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      Text("2 Pending", style: TextStyle(color: Colors.green)),
                      Text(
                        "150 Missed",
                        style: TextStyle(color: AppColors.roleText),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "IDN Shared",
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      Text("2 Pending", style: TextStyle(color: Colors.green)),
                      Text(
                        "150 Missed",
                        style: TextStyle(color: AppColors.roleText),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "IDN Web   ",
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      Text(
                        " 0 Pending",
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                      Text(
                        "0 Missed    ",
                        style: TextStyle(color: AppColors.roleText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //  bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
