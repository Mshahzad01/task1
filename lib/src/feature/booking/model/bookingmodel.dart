// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:task1/src/constant/asset_string.dart';

enum Userstatus {
  opened,
  close;

  String get title => switch (this) {
        Userstatus.opened => "open",
        Userstatus.close => "close",
      };

      Color get color => switch(this){

        opened => Colors.green,
        close => Colors.grey,
      };

      String get newvalue => switch (this){
        opened => "Quotes 51",
        close =>  "8 month ago "

      };
}

class Bookingmodel {
  final String pitcher;
  final String name;
  final double price;
  final String location;
  final String note;
  final DateTime dateTime;
  final double distance1;
  final double distance2;
  final String accoutopen;
  final Userstatus userstatus;
  final String cancelBy;
  final double ratting;
  final int totaloder;
  final String worktype;
  final String startLocation;
final String endLocation;



  Bookingmodel({
    required this.pitcher,
    required this.name,
    required this.price,
    required this.location,
    required this.note,
    required this.dateTime,
    required this.distance1,
    required this.distance2,
    required this.accoutopen,
    required this.userstatus,
    required this.cancelBy,
    required this.ratting,
    required this.totaloder,
    required this.worktype,
      required this.startLocation,
required this.endLocation,
  });
}

// ✅ Dummy Data
List<Bookingmodel> dumydatabooking = [
  Bookingmodel(
    pitcher: AssetString.imagethree,
    name: "Jake John",
    price: 50.9,
    location: "Moffett Federal Airfield, 158 Cody Rd, Mountain View, CA",
    note: "Fix my sink leakeage",
    dateTime: DateTime.now().add(Duration(days: 1, hours: 8, minutes: 30)), // Tomorrow 08:30 am
    distance1: 0.5,
    distance2: 0.6,
    accoutopen: "8m ago",
    userstatus: Userstatus.opened,
    cancelBy: "Jake",
    ratting:  3.5,
    totaloder:  45,
    worktype:  "Plumber",
 startLocation: "123 Main St, SF",
endLocation: "456 Elm St, CA",


  ),

  Bookingmodel(
    pitcher: AssetString.imageone,
    name: "Lisa",
    price: 100.0,
    location: "Moffett Federal Airfield, 158 Cody Rd, Mountain View, CA",
    note: "Fix my sink leakeage",
    dateTime: DateTime.now().add(Duration(days: 1, hours: 8, minutes: 30)),
    distance1: 1.0,
    distance2: 2.0,
    accoutopen: "5m ago",
    userstatus: Userstatus.opened,
    cancelBy: "You",
        ratting:  3.5,
    totaloder:  45,
     worktype:  "Plumber",
startLocation: "123 Main St, SF",
endLocation: "456 Elm St, CA",


  ),

  Bookingmodel(
    pitcher: AssetString.imagetow,
    name: "Alex Smith",
    price: 85.20,
    location: "Stanford Ave, Palo Alto, CA",
    note: "Downtown, Palo Alto, CA",
    dateTime: DateTime.now().add(Duration(hours: 2)), // Today 02:00 pm approx.
    distance1: 1.2,
    distance2: 6.3,
    accoutopen: "2h ago",
    userstatus: Userstatus.close,
    cancelBy: "Alex",
        ratting:  3.5,
    totaloder:  45,
     worktype:  "Plumber",
 startLocation: "123 Main St, SF",
endLocation: "456 Elm St, CA",


  ),
];
