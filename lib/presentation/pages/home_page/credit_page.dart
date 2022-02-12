import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credits_app_bar.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credits_body.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credits_drawer.dart';

class CreditPage extends StatelessWidget {
  CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      
      body: HomePageBody(),
    );
  }
}
