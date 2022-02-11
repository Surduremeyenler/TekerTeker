import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/home_page_widgets/home_page_body.dart';
import 'package:teker_teker/presentation/widgets/home_page_widgets/home_page_drawer.dart';

class CreditPage extends StatelessWidget {
  CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: HomePageDrawer(),
        body: HomePageBody());
  }
}
