import 'package:flutter/material.dart';
import 'package:teker_teker/infrastructure/firebase_user_service/firebase_user_service.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/credit_numbers_widget.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_widgets.dart';

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({Key? key}) : super(key: key);
  final user = FirebaseUserService().getUser();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data as Map<String, dynamic>;
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: data['photoURL'],
                    onClicked: () {},
                  ),
                  const SizedBox(height: 24),
                  BuildName(data['displayName'], data['email']),
                  const SizedBox(height: 24),
                  CreditNumbersWidget(context,
                      turkishLira: data['turkish_lira'],
                      credit: data['credit']),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width / 5,
                        MediaQuery.of(context).size.height / 15,
                      ))),
                      onPressed: () {},
                      child: Text("Convert Credit to Turkish Lira"))
                ],
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
