import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/profile/profile_cubit.dart';
import 'package:teker_teker/presentation/constants/constants.dart';

import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_body.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBodyColor,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 10),
          child: ProfilePageAppBar(
            context,
          )),
      body: BlocProvider(
        create: (context) => ProfileCubit()..getProfileInformations(),
        child: ProfilePageBody(),
      ),
    ));
  }
}
