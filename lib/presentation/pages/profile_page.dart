import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LogOutButton(),
    );
  }
}
