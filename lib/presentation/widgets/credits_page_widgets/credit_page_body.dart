import 'package:flutter/material.dart';
import 'package:teker_teker/infrastructure/profile_service/profile_service.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_widgets.dart';
import 'package:teker_teker/presentation/widgets/loading_indicator.dart';

class CreditPageBody extends StatelessWidget {
  CreditPageBody({Key? key}) : super(key: key);
  final _firebaseFirestore = ProfileService().getUserInformation();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseFirestore,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data as Map;

              return Stack(
                children: [
                  CreditPageTopSection(
                    firebaseFirestore: data,
                  ),
                  CreditPageBottomSection(firebaseFirestore: data),
                ],
              );
            }
          }
          return LoadingIndicator();
        });
  }
}
