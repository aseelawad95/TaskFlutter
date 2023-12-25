import 'package:flutter/material.dart';

import 'package:task_flutter/navigationBar/screen1.dart';
import 'package:task_flutter/navigationBar/screen2.dart';

class NavbarProvider with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: 'Home', widget: const Screen1(), iconData: Icons.home),
    NavbarDTO(label: 'Chat', widget: const Screen2(), iconData: Icons.chat),
    // NavbarDTO(label: 'Profile',widget: Screen3(),iconData: Icons.account_box_rounded),
  ];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class NavbarDTO {
  Widget? widget;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData});
}
