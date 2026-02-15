import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'own_equipment_screen.dart';
import 'settings_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    OwnEquipmentScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black, // Pure black
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem(Icons.group, 'Characters', _currentIndex == 0),
          _buildNavItem(Icons.person, 'Own Equipment', _currentIndex == 1),
          _buildNavItem(Icons.settings, 'Settings', _currentIndex == 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.orange : Colors.black,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.white,
            width: 2,
          ),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      label: label,
    );
  }
}
