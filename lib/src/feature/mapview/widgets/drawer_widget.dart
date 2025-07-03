
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/src/constant/app_color.dart';

import 'package:task1/src/constant/textstyle.dart';

import 'package:task1/src/feature/mapview/widgets/avatar.dart' show BlurAvatar;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Stack(
          children: [
       
          
               BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: AppColors.backgroundBlur,
                ),
              ),
        

           
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text("🎗️Free Account Member", style: AppTextStyles.title),
                    const SizedBox(height: 26),
                    const BlurAvatar(),
                    const SizedBox(height: 20),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                        Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                        Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                        Icon(Icons.star, color: AppColors.ratingStar, size: 20),
                        Icon(Icons.star_half, color: AppColors.ratingStar, size: 20),
                        SizedBox(width: 4),
                        Text("4.5", style: TextStyle(color: Colors.white)),
                      ],
                    ),

                    const SizedBox(height: 4),
                    Text("Since July 2020", style: AppTextStyles.subtitle),
                    const SizedBox(height: 8),
                    Text("MJ Lee", style: AppTextStyles.name),
                    Text("Private Driver", style: AppTextStyles.role),
                    Text("Bondi Beach, NSW, Australia", style: AppTextStyles.location),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: GridView.count(
                        childAspectRatio: 1.2,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _buildDrawerButton(Icons.add, "Create"),
                          _buildDrawerButton(Icons.schedule, "Schedule"),
                          _buildDrawerButton(Icons.people, "Clients", count: 256),
                          _buildDrawerButton(Icons.message, "Messages"),
                          _buildDrawerButton(Icons.receipt_long, "Invoices"),
                          _buildDrawerButton(Icons.business_center, "Business"),
                          _buildDrawerButton(Icons.settings, "Settings"),
                          _buildDrawerButton(Icons.headset_mic, "Support"),
                          _buildDrawerButton(Icons.person_pin_circle, "Nearby"),
                          _buildDrawerButton(Icons.shortcut, "Shortcut"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("All systems operational!", style: AppTextStyles.caption),
                        const SizedBox(width: 5),
                        SvgPicture.asset("assets/icon/Check Circle.svg"),
                      ],
                    ),

                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("V4.0 Holy Granade", style: AppTextStyles.caption),
                        const SizedBox(width: 8),
                        Image.asset("assets/icon/layer1 1.png"),
                      ],
                    ),

                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.logoutBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("Logout", style: TextStyle(color: AppColors.red)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton(IconData icon, String label, {int? count}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppColors.primaryText, size: 28),
                const SizedBox(height: 8),
                Text(label, style: AppTextStyles.drawerButton),
              ],
            ),
          ),
          if (count != null)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
