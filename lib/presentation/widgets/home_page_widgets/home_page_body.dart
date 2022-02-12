import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/home_page_widgets/home_page_app_bar.dart';
import 'package:teker_teker/presentation/widgets/home_page_widgets/home_page_body_widgets.dart';
import 'package:teker_teker/presentation/widgets/home_page_widgets/home_page_drawer.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: HomePageDrawer(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 10),
            child: HomePageAppBar()),
        body: HomePageBodyWidgets(),
      ),
    );
  }
}
