
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task1/src/constant/textstyle.dart';


import '../model/appointment_model.dart';


class AppointmentListWidget extends StatelessWidget {
  const AppointmentListWidget({super.key});

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
          itemCount: AppointmentModel.dummyData.length,
          itemBuilder: (context, index) {
            final AppointmentModel data = AppointmentModel.dummyData[index];
            final bool hasStatus = data.status != null;

            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: hasStatus ? 170 : 140,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: data.bookingStatus.color.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasStatus)
                      Text(
                        data.bookingStatus.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    const SizedBox(height: 6),
                    CircleAvatar(
                      backgroundImage: AssetImage(data.image),
                      radius: 40,
                    ),
                    const SizedBox(height: 6),
                    
                      Text(DateFormat.Hm().format(data.time),style: AppTextStyles.appoimentitle,), // Safe and clean

                    
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
