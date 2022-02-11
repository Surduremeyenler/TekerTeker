import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/auth/auth_cubit.dart';
import 'package:teker_teker/presentation/pages/home_page/home_page_navigator.dart';
import 'package:teker_teker/presentation/pages/login_page/sign_in_page.dart';

class AuthLandingPage extends StatelessWidget {
  const AuthLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthState>(
      state: context.select((AuthCubit cubit) => cubit.state),
      onGeneratePages: (authState, pages) {
        if (authState.isSignedIn) {
          return [HomePageNavigator.page()];
        } else {
          return [SignInPage.page()];
        }
      },
    );
  }
}
