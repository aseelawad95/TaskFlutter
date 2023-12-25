import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/navigationBar/nav.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavbarProvider>(
      context,
    );
    return Scaffold(
      body: mp.items[mp.selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mp.selectedIndex,
        onTap: (i) {
          mp.selectedIndex = i;
        },
        items: mp.items
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.iconData), label: e.label))
            .toList(),
      ),
    );
  }
}
