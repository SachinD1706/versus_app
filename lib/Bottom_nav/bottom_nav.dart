import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        selectedFontSize: 13,
        unselectedFontSize: 13,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/ticket.svg",
              width: 24,
              height: 24,
            ),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/sports.svg",
              width: 24,
              height: 24,
            ),
            label: "Brackets",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/person.svg",
              width: 24,
              height: 24,
            ),
            label: "Profiles",
          ),
        ],
      ),
    );
  }
}
