import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task1/src/constant/app_color.dart';

import '../model/chart_model.dart';
import '../widget/chartwidget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blur background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: AppColors.backgroundBlur,
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top buttons
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Allow channels"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6E72FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("View Availability"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Header text and line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Business Growth",
                          style: GoogleFonts.nunito(
                              fontSize: 14, color: Colors.white)),
                      Container(
                        height: 1.0,
                        width: 100,
                        color: Colors.grey,
                      ),
                      Text("Last 30 days",
                          style: GoogleFonts.nunito(
                              fontSize: 12, color: Colors.white60)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Charts
                  BookingChartCard(
                    title: "Total\nBookings",
                    percentageChange: 10.0,
                    monthData: bookingMonthData,
                    weekData: bookingWeekData,
                    dayData: bookingDayData, value: 50, 
                  
                  ),
                  BookingChartCard(
                    title: "Total\nRevenue",
                    percentageChange: 10.0,
                    monthData: revenueMonthData,
                    weekData: revenueWeekData,
                    dayData: revenueDayData, 
                   value: 600 ,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
