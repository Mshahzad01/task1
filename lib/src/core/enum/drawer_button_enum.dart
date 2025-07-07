// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
enum infobutton {
  Create,
  Schedule,
  Clients,
  Messages,
  Invoices,
  Business,
  Settings,
  Support,
  Nearby,
  Shortcut;

  String get title => switch (this) {
    Create => "Create",
    Schedule => "Schedule",
    Clients => "Clients",
    Messages => "Messages",
    Settings => "Settings",
    Invoices => "Invoices",
    Business => "Business",
    Support => "Support",
    Nearby => "Nearby",
    Shortcut => "Shortcut",
   
  };

  IconData get icondata => switch (this) {
    Create => Icons.add,
    Schedule => Icons.schedule,
    Clients => Icons.people,
    Messages => Icons.message,
    Invoices => Icons.receipt_long,
    Business => Icons.business,
    Settings => Icons.settings,
    Support => Icons.support,
    Nearby => Icons.person_pin_circle,
    Shortcut => Icons.shortcut,
  };
}
