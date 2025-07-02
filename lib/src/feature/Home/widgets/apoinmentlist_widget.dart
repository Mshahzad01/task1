import 'package:flutter/material.dart';
import 'package:task1/src/constant/textstyle.dart';

class AppointmentListWidget extends StatelessWidget {
  const AppointmentListWidget({super.key});

  final List<Map<String, dynamic>> appointments = const [
    {
      // No status
      "image": "assets/image/i (1).png",
      "time": "Now",
      "color": Color(0xff1c643e),
    },
    {
      "status": "Pending",
      "image": "assets/image/i (2).png",
      "time": "15:30",
      "color": Color(0xff8a2525),
    },
    {
      // No status
      "image": "assets/image/i (2).png",
      "time": "17:30",
      "color": Color(0xff161616),
    },
    {
      "status": "Upcoming",
      "image": "assets/image/i (3).png",
      "time": "16:30",
      "color": Color(0xff3f476e),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final data = appointments[index];
            final bool hasStatus = data['status'] != null;

            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: hasStatus ? 170 : 130, // 👈 Individual container height
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: (data['color'] as Color).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasStatus) ...[
                      Text(
                        data['status'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                    ],
                    CircleAvatar(
                      backgroundImage: AssetImage(data['image']),
                      radius: 40,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data['time'],
                      style: AppTextStyles.appoimentitle
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
