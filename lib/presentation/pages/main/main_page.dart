import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.house_outlined,
            ),
            selectedIcon: Icon(
              Icons.house_rounded,
            ),
            label: 'Объекты',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.panorama_horizontal_rounded,
            ),
            selectedIcon: Icon(
              Icons.panorama_horizontal_select_rounded,
            ),
            label: 'Сеты',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
            ),
            selectedIcon: Icon(
              Icons.person_rounded,
            ),
            label: 'Профиль',
          ),
        ],
        onDestinationSelected: changeTab,
      ),
    );
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/sets');
        break;
      default:
        context.go('/profile');
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }
}
