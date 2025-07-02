import 'package:flutter/material.dart';

class DayInfoWidget extends StatelessWidget {
  final String? num;
  final String day;
  final String number;

 // optional image path for CircleAvatar

  const DayInfoWidget({
    super.key,
    this.num,
    required this.day,
    required this.number,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 🔹 Optional CircleAvatar
          if(num != null)
          CircleAvatar(
            radius: 06,
            backgroundColor: Colors.blue,
           child: Text(num!,style:  TextStyle(fontSize: 08,color: Colors.white),),
          ),

        /// 🔹 Day Name
        Text(
          day,
          style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400 ),
        ),

        /// 🔹 Number Text
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w500
            //fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
