import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/presentation/widgets/login_page_widgets/sign_in_page_body.dart';
import 'package:teker_teker/presentation/widgets/login_page_widgets/sign_in_page_widgets.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listenWhen: (p, c) => p.status != c.status,
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBarWhenFailure(
                  snackBarFailureText: state.exceptionError));
            } else if (state.status.isSubmissionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBarWhenSuccess());
            }
          },
          builder: (context, state) {
            return SignInPageBody();
          }),
    );
  }
}
