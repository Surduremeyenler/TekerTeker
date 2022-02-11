import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/login_page_widgets/logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LogOutButton(),
    );
  }
}
