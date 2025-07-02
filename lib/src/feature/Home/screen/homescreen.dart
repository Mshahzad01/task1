import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/textstyle.dart';
import 'package:task1/src/feature/Home/widgets/apoinmentlist_widget.dart';
import 'package:task1/src/feature/Home/widgets/bottomnavigationbar.dart';
import 'package:task1/src/feature/Home/widgets/clintlocation_avator.dart';
import 'package:task1/src/feature/Home/widgets/dayinfo_widget.dart';
import 'package:task1/src/feature/Home/widgets/drawer_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        automaticallyImplyLeading: false,

        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset("assets/icon/drawer.svg"),
          ),
        ),

        title: Column(
          children: [
            Text('Forecast Daily Earnings', style: AppTextStyles.appbartitle),
            Text("\$246.54", style: AppTextStyles.appbartitle),
          ],
        ),
        centerTitle: true,

        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Clients ', style: AppTextStyles.appbartitle),
              Text('256', style: AppTextStyles.appbartitle),
            ],
          ),
        ],
      ),

      body: Stack(
        children: [
          Image.asset(
            "assets/image/map_image.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          /// Date Selector
          Positioned(
            top: 100,
            left: 05,
            right: 05,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 75,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Color(0xff272727).withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("All"),
                  SizedBox(width: 05),

                  Text("Jul", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 05),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.white54,
                  ),
                  SizedBox(width: 05),

                  DayInfoWidget(day: "Tue", number: '8th', num: "2"),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Wed", number: '9th', num: "1"),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Thu", number: '10th'),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Fri", number: '11th'),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Sat", number: '12th'),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Sun", number: '13th'),
                  SizedBox(width: 08),
                  DayInfoWidget(day: "Mon", number: '14th'),

                  SizedBox(width: 08),

                  SvgPicture.asset("assets/icon/power-01.svg"),
                ],
              ),
            ),
          ),

          const AppointmentListWidget(),

          Positioned(
            bottom: 100,
            left: 0,
            right: 250,
            child: const BorderedCircleAvatar(
              imagePath: "assets/image/Oval (1).png",
              borderColor: AppColors.red, 
            ),
          ),

          Positioned(
            top: 400,
            left: 0,
            right: 170,
            child: const BorderedCircleAvatar(
              imagePath: "assets/image/i (3).png",
              borderColor: AppColors.blue, 
            ),
          ),

          Positioned(
            bottom: 250,
            left: 170,
            right: 0,
            child: const BorderedCircleAvatar(
              imagePath: "assets/image/i (2).png",
              borderColor: AppColors.orange, // your desired border color
            ),
          ),

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

      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
