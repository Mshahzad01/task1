
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/src/constant/textstyle.dart';

import '../model/appbarmodel.dart';



class Appbarwidget extends StatelessWidget implements PreferredSizeWidget {

 

  final AppBarInfoModel info;

   const Appbarwidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.6),
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
          Text('\$${info.earnings}', style: AppTextStyles.appbartitle),
        ],
      ),
      centerTitle: true,

      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Clients', style: AppTextStyles.appbartitle),
            Text(info.totalClients, style: AppTextStyles.appbartitle),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
