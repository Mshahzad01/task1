import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:task1/src/constant/dark_theme.dart';
import 'package:task1/src/feature/bottomnavigation_bar/bottom_naviagtion_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: DarkTheme.theme,
      home: CustomBottomNavBar(),
    );
  }
}
