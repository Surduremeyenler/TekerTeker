import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/pages/home_page/credit_page.dart';
import 'package:teker_teker/presentation/pages/home_page/map_page.dart';
import 'package:teker_teker/presentation/pages/home_page/profile_page.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePageNavigator());

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  final List<Widget> _screens = [
    CreditPage(),
    MapPage(),
    ProfilePage(),
  ];
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: bottomNavBar2,
      icon: Icon(Icons.cabin),
    ),
    BottomNavigationBarItem(
      label: bottomNavBar1,
      icon: Icon(Icons.map),
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
