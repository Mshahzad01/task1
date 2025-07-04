// ignore_for_file: non_constant_identifier_names

import 'package:task1/src/constant/asset_string.dart';

enum Userstatus {
  opened,
  close;

  String get title => switch (this) {
        Userstatus.opened => "Opened",
        Userstatus.close => "Close",
      };
}

class Bookingmodel {
  final String pitcher;
  final String name;
  final double price;
  final String location;
  final String extralocation;
  final DateTime dateTime;
  final double distance1;
  final double distance2;
  final String accoutopen;
  final Userstatus userstatus;
  final String cancelBy;
  final double ratting;
  final int totaloder;

  Bookingmodel({
    required this.pitcher,
    required this.name,
    required this.price,
    required this.location,
    required this.extralocation,
    required this.dateTime,
    required this.distance1,
    required this.distance2,
    required this.accoutopen,
    required this.userstatus,
    required this.cancelBy,
    required this.ratting,
    required this.totaloder,
  });
}

// ✅ Dummy Data
List<Bookingmodel> dumydatabooking = [
  Bookingmodel(
    pitcher: AssetString.imagethree,
    name: "Jake John",
    price: 50.9,
    location: "Moffett Federal Airfield, 158 Cody Rd, Mountain View, CA",
    extralocation: "Jackson Park, Mountain View, CA 94043, USA",
    dateTime: DateTime.now().add(Duration(days: 1, hours: 8, minutes: 30)), // Tomorrow 08:30 am
    distance1: 0.5,
    distance2: 0.6,
    accoutopen: "8m ago",
    userstatus: Userstatus.close,
    cancelBy: "Jake",
    ratting:  3.5,
    totaloder:  45
  ),

  Bookingmodel(
    pitcher: AssetString.imageone,
    name: "Lisa",
    price: 100.0,
    location: "Moffett Federal Airfield, 158 Cody Rd, Mountain View, CA",
    extralocation: "",
    dateTime: DateTime.now().add(Duration(days: 1, hours: 8, minutes: 30)),
    distance1: 1.0,
    distance2: 2.0,
    accoutopen: "5m ago",
    userstatus: Userstatus.opened,
    cancelBy: "You",
        ratting:  3.5,
    totaloder:  45
  ),

  Bookingmodel(
    pitcher: AssetString.imagetow,
    name: "Alex Smith",
    price: 85.20,
    location: "Stanford Ave, Palo Alto, CA",
    extralocation: "Downtown, Palo Alto, CA",
    dateTime: DateTime.now().add(Duration(hours: 2)), // Today 02:00 pm approx.
    distance1: 1.2,
    distance2: 6.3,
    accoutopen: "2h ago",
    userstatus: Userstatus.opened,
    cancelBy: "Alex",
        ratting:  3.5,
    totaloder:  45
  ),
];
