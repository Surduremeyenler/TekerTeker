import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/domain/auth_models/auth_text_field.dart';
import 'package:teker_teker/domain/auth_models/email.dart';
import 'package:teker_teker/domain/auth_models/password.dart';
import 'package:teker_teker/presentation/pages/login_page/sign_up_page.dart';

Widget LoginText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
    child: Text(
      'Welcome to TEKER TEKER App',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget SeperatedText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
    child: Text(
      'OR',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    ),
  );
}

Widget EmailInputField() {
  return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextField(
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          error: state.email.error?.name,
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
        );
      });
}

Widget PasswordInputField() {
  return BlocBuilder<LoginCubit, LoginState>(
    buildWhen: (previous, current) => previous.password != current.password,
    builder: (context, state) {
      return AuthTextField(
        padding: const EdgeInsets.symmetric(vertical: 20),
        hint: 'Password',
        isPasswordField: true,
        keyboardType: TextInputType.text,
        error: state.password.error?.name,
        onChanged: (password) =>
            context.read<LoginCubit>().passwordChanged(password),
      );
    },
  );
}

Widget Login() {
  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SignInButton(Buttons.Email,
              mini: true,
              onPressed: () =>
                  context.read<LoginCubit>().logInWithCredentials()));
    },
  );
}

Widget SignUpButton(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, right: 5),
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        margin: const EdgeInsets.all(3),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      color: Colors.blueAccent,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        )
      },
    ),
  );
}

Widget ForgotPassword() {
  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, left: 5),
        child: CupertinoButton(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(3),
            child: Container(
              margin: const EdgeInsets.all(3),
              child: const Text(
                'Forgot Pw',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            color: Colors.blueAccent,
            onPressed: () {
              context.read<LoginCubit>().resetPassword();
            }),
      );
    },
  );
}

Widget SignInWithGoogle() {
  return BlocBuilder<LoginCubit, LoginState>(
    buildWhen: (previous, current) => previous.status != current.status,
    builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SignInButton(Buttons.Google,
              onPressed: () => context.read<LoginCubit>().signInWithGoogle()));
    },
  );
}

SnackBar SnackBarWhenSuccess() {
  return const SnackBar(
    content: Text("Success!"),
    backgroundColor: Colors.green,
  );
}

SnackBar SnackBarWhenFailure({required String snackBarFailureText}) {
  return SnackBar(
    content: Text(snackBarFailureText),
    backgroundColor: Colors.red,
  );
}
