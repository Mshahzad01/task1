import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/src/constant/app_color.dart';


class AppTextStyles {
  static final title = GoogleFonts.quicksand(
    color: AppColors.primaryText,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final subtitle = GoogleFonts.quicksand(
    color: AppColors.subtitleText,
    fontSize: 12,
  );

   static final appbartitle = GoogleFonts.quicksand(
    color: AppColors.primaryText,
    fontSize: 13,
    fontWeight: FontWeight.bold
  );
  
   static final appoimentitle = GoogleFonts.quicksand(
    color: AppColors.primaryText,
    fontSize: 15,
    fontWeight: FontWeight.bold
  );

  static final name = GoogleFonts.quicksand(
    color: AppColors.primaryText,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final role = GoogleFonts.quicksand(
    color: AppColors.roleText,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final location = GoogleFonts.quicksand(
    color: AppColors.locationText,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static final caption = GoogleFonts.quicksand(
    color: AppColors.subtitleText,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final drawerButton = GoogleFonts.quicksand(
    color: AppColors.primaryText,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}