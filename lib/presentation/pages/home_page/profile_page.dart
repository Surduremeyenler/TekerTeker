import 'package:flutter/material.dart';

import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_body.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 10),
            child: ProfilePageAppBar(
              context,
            )),
        body: ProfilePageBody(),
      ),
    );
  }
}
