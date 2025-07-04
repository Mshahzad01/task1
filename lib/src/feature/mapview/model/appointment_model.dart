import 'package:flutter/material.dart';


enum BookingStatus {
  pending,
  inProgress,
  completed;

  String get title => switch (this) {
    pending => 'Pending',
    inProgress => 'Progress',
    completed => 'Completed',
  };

  Color get color => switch (this) {
    pending => Colors.red,
    inProgress => Colors.black,
    completed => Colors.green,
  };
}





class AppointmentModel {
  final String? status;
  final String image;
  final DateTime time;
  final BookingStatus bookingStatus;

  AppointmentModel({
    this.status,
    required this.image,
    required this.time,
    required this.bookingStatus,
  });
       
     //  DateFormat('Hms', 'en_US').parse('14:23:01');
  static List<AppointmentModel> dummyData = [
    AppointmentModel(
     // status:'panding',
      image: 'assets/image/i (3).png',
      time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
    AppointmentModel(
      status: '',
      image: 'assets/image/i (2).png',
      time:  DateTime.now(),
      bookingStatus: BookingStatus.pending,
    ),
    AppointmentModel(
      image: 'assets/image/i (3).png',
     time:  DateTime.now(),
      bookingStatus: BookingStatus.completed,
    ),
    AppointmentModel(
      image: 'assets/image/i (1).png',
      time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
    AppointmentModel(
      image: 'assets/image/i (2).png',
     time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
    AppointmentModel(
      image: 'assets/image/i (2).png',
      time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
    AppointmentModel(
      image: 'assets/image/i (2).png',
       time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
    AppointmentModel(
      image: 'assets/image/i (3).png',
     time:  DateTime.now(),
      bookingStatus: BookingStatus.inProgress,
    ),
  ];
}
