import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_widgets.dart';

class CreditPageBody extends StatelessWidget {
  const CreditPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CreditPageTopSection(context),
        CreditPageBottomSection(context),
      ],
    );
  }
}
