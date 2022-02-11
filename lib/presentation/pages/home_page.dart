import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/infrastructure/consts.dart';
import 'package:teker_teker/presentation/pages/credit_page.dart';
import 'package:teker_teker/presentation/pages/map_page.dart';
import 'package:teker_teker/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    MapPage(),
    CreditPage(),
    ProfilePage(),
  ];
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: bottomNavBar1,
      icon: Icon(Icons.map),
    ),
    BottomNavigationBarItem(
      label: bottomNavBar2,
      icon: Icon(Icons.cabin),
    ),
    BottomNavigationBarItem(
      label: bottomNavBar3,
      icon: Icon(Icons.radio_button_unchecked_sharp),
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              updateTabSelection(index);
            },
            items: items,
          ),
          body: _screens[_selectedIndex]),
    );
  }

  void updateTabSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
