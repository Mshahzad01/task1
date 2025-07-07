import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/src/constant/app_color.dart';
import 'package:task1/src/constant/asset_string.dart';
import 'package:task1/src/core/extension/context_ext.dart';
import 'package:task1/src/core/services/googlemap.dart';
import 'package:task1/src/feature/mapview/widgets/dayinfo_widget.dart';
import '../widgets/appoiment_widget.dart';

class MapViewscreen extends StatefulWidget {
  const MapViewscreen({super.key});

  @override
  State<MapViewscreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<MapViewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          // Google mapp
          WorldMapWidget(),
         

         //Clinder implement
          Positioned(
            top: 10,
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
                  Text(
                    "All",
                    style: context.myTextTheme.titleMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.subtitleText,
                    ),
                  ),

                  Expanded(child: const AutoMonthUpdateScroller()),
                  Container(width: 1, height: 40, color: Colors.white30),
                  SizedBox(width: 04),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(AssetString.powerbutton),
                  ),
                ],
              ),
            ),
          ),


          // Apoiment list implement 

          const AppointmentListWidget(),
        ],
      ),
    );
  }
}
