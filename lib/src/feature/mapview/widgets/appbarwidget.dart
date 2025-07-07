import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/src/constant/asset_string.dart';
import 'package:task1/src/constant/textstyle.dart';

import '../model/appbarmodel.dart';

class Appbarwidget extends StatelessWidget implements PreferredSizeWidget {
  const Appbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppBarInfoModel> data = userinfo;

    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.6),
      elevation: 0,
      automaticallyImplyLeading: false,

      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(
            AssetString.drawericon,
            width: 16,
            height: 16,
          ),
        ),
      ),

      title: Column(
        children: [
          Text('Forecast Daily Earnings', style: AppTextStyles.appbartitle),
          Text('\$${data[0].earnings}', style: AppTextStyles.appbartitle3),
        ],
      ),
      centerTitle: true,

      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Clients', style: AppTextStyles.appbartitle2),
            Text("${data[0].totalClients}", style: AppTextStyles.appbartitle3),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
