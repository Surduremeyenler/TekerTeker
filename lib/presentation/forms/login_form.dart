import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/presentation/widgets/login_page_widgets/sign_in_page_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          builder: (context, state) => Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LoginText(),
                          EmailInputField(),
                          PasswordInputField(),
                          Row(
                            children: [
                              Expanded(child: SignUpButton(context)),
                              Expanded(child: Login()),
                              Expanded(child: ForgotPassword())
                            ],
                          ),
                          Column(
                            children: [
                              SeperatedText(),
                              SignInWithGoogle(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  state.status.isSubmissionInProgress
                      ? const Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(),
                ],
              )),
    );
  }
}
