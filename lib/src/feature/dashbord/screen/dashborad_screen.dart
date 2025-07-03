// File: lib/src/feature/dashboard/screen/dashboard_screen.dart

import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/textstyle.dart';

import '../../mapview/widgets/drawer_widget.dart';




class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   // backgroundColor:Colors.transparent,
     drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
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
        children:[
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: AppColors.backgroundBlur,
                ),
              ),
           Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 70,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                    color: Colors.black.withOpacity(0.3),
                ),
                //width: double.infinity,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text("Allow channels"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6E72FC),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text("View Availability"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business Growth",
                      style: GoogleFonts.nunito(
                          fontSize: 14, color: Colors.white)),


                          Container(
                            height: 01,
                            width: 100,
                            color: Colors.grey,
                          ),
                  Text("Last 30 days",
                      style: GoogleFonts.nunito(
                          fontSize: 12, color: Colors.white60)),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
               // height: double.infinity,
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2C3E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total\nBookings",
                                        style: AppTextStyles.name),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("+0%",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.green)),
                                    Text("0",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20, color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ToggleButtons(
                                  isSelected: const [true, false, false],
                                  selectedColor: Colors.white,
                                  color: Colors.white60,
                                  fillColor: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                  onPressed: (_) {},
                                  children: const [
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Month")),
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Week")),
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Day")),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16),

                            SizedBox(
  height: 150,
  child: LineChart(
    LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(1, 1),
            FlSpot(2, 0.5),
            FlSpot(3, 1.5),
            FlSpot(4, 1),
            FlSpot(5, 2),
            FlSpot(6, 1.8),
          ],
          isCurved: true,
          color: Colors.deepPurple,
          barWidth: 2,
          dotData: FlDotData(show: false),
        ),
      ],
    ),
  ),
)

                         
                          ],
                        ),
                      ),
                
                
                      SizedBox(
                        height: 10,
                      ),
                
                
                        Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2C3E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Bookings",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text("Last 30 days",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, color: Colors.white60))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("+0%",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.green)),
                                    Text("0",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20, color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ToggleButtons(
                                  isSelected: const [true, false, false],
                                  selectedColor: Colors.white,
                                  color: Colors.white60,
                                  fillColor: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                  onPressed: (_) {},
                                  children: const [
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Month")),
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Week")),
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text("Day")),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white12),
                              ),
                              alignment: Alignment.center,
                              child: Text("📊 Graph Placeholder",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white38, fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             // const Spacer(),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   color: const Color(0xFF1C1B2F),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Text("Quotes",
              //               style: TextStyle(color: Colors.white60)),
              //           const Row(
              //             children: [
              //               Text("0 Sent", style: TextStyle(color: Colors.orange)),
              //               SizedBox(width: 8),
              //               Text("0 Won", style: TextStyle(color: Colors.green)),
              //             ],
              //           )
              //         ],
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           const Text("Potential Clients",
              //               style: TextStyle(color: Colors.white60)),
              //           Text("24",
              //               style: GoogleFonts.poppins(
              //                   color: Colors.white, fontSize: 14))
              //         ],
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        ]
      ),

      
    );
  }
}
