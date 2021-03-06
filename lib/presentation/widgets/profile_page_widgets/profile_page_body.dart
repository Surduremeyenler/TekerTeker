import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/cubit/profile_cubit.dart';
import 'package:teker_teker/presentation/widgets/loading_indicator.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_widgets.dart';

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state.isLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      } else if (state.isLoaded) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildProfile(state),
                SizedBox(
                  height: 20,
                ),
                buildCards(state),
                SizedBox(
                  height: 40,
                ),
                buildRidesHistory(state),
              ],
            ),
          ),
        );
      } else {
        return LoadingIndicator();
      }
    });
  }

  Column buildProfile(state) {
    return Column(
      children: [
        ProfileWidget(
          imagePath: state.profileInformation['photoURL'],
          onClicked: () {},
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          state.profileInformation['displayName'],
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          state.profileInformation['email'],
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
