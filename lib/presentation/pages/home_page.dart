import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/application/map/map_cubit.dart';
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
    BlocProvider(
      create: (context) => MapCubit()..loadMarkers(),
      child: MapPage(),
    ),
    ProfilePage(),
  ];
  final items = <FlashyTabBarItem>[
    FlashyTabBarItem(
      title: Text(bottomNavBar2),
      icon: Icon(Icons.cabin),
    ),
    FlashyTabBarItem(
      title: Text(bottomNavBar1),
      icon: Icon(Icons.map),
    ),
    FlashyTabBarItem(
      title: Text(bottomNavBar3),
      icon: Icon(Icons.radio_button_unchecked_sharp),
    ),
  ];
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          bottomNavigationBar: 
          FlashyTabBar(items: items,onItemSelected: (index)=>updateTabSelection(index),selectedIndex: _selectedIndex,),
        
          body: _screens[_selectedIndex]),
    );
  }

  void updateTabSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
