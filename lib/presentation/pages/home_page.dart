import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/home_page_router/home_page_router_cubit.dart';
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
    MapPage(),
    ProfilePage(),
  ];

  final items = <FlashyTabBarItem>[
    FlashyTabBarItem(
      title: Text(bottomNavBar2,style: TextStyle(color: Colors.black),),
      icon: Icon(Icons.cabin,color: Colors.grey,),
    ),
    FlashyTabBarItem(
      title: Text(bottomNavBar1,style: TextStyle(color: Colors.black),),
      icon: Icon(Icons.map,color: Colors.grey,),
    ),
    FlashyTabBarItem(
      title: Text(bottomNavBar3,style: TextStyle(color: Colors.black),),
      icon: Icon(Icons.radio_button_unchecked_sharp,color: Colors.grey,),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => HomePageRouterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return HomePageSlice(
          items: items,
          screens: _screens,
        );
      }),
    );
  }
}

class HomePageSlice extends StatelessWidget {
  const HomePageSlice({
    Key? key,
    required this.items,
    required List<Widget> screens,
  })  : _screens = screens,
        super(key: key);

  final List<FlashyTabBarItem> items;
  final List<Widget> _screens;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageRouterCubit, HomePageRouterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBodyColor,
          bottomNavigationBar: FlashyTabBar(
            backgroundColor: Colors.white,
              items: items,
              onItemSelected: (index) {
                context
                    .read<HomePageRouterCubit>()
                    .changeThePage(newPageIndex: index);
              },
              selectedIndex: state.pageIndex),
          body: _screens[state.pageIndex],
        );
      },
    );
  }
}
