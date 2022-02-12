import 'package:flutter/material.dart';
import 'package:teker_teker/infrastructure/firebase_user_service/firebase_user_service.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_widgets.dart';

class CreditPageBody extends StatelessWidget {
  CreditPageBody({Key? key}) : super(key: key);
  final _firebaseFirestore = FirebaseUserService().getUser();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseFirestore,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
          return Center(child: CircularProgressIndicator());
        });
  }
}
