import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_body.dart';

class CreditPage extends StatelessWidget {
  CreditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: CreditPageBody(),
      ),
    );
  }
}
