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
      "TEKER TEKER'e Hoşgeldin",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget SeperatedText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
    child: Text(
      'VEYA',
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
            onChanged: (email) {
              context.read<LoginCubit>().emailChanged(email);
            });
      });
}

Widget PasswordInputField() {
  return BlocBuilder<LoginCubit, LoginState>(
    buildWhen: (previous, current) => previous.password != current.password,
    builder: (context, state) {
      return AuthTextField(
        hint: 'Şifre',
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
              mini: false,
              onPressed: () =>
                  context.read<LoginCubit>().logInWithCredentials()));
    },
  );
}

Widget SignUpButton(context) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    },
    child: const Text(
      'Hesabın Yok mu? Hemen Kaydol',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );
}

Widget ForgotPassword() {
  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      return TextButton(
        onPressed: () {
          context.read<LoginCubit>().resetPassword();
        },
        child: const Text(
          'Şifreni mi Unuttun?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
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
    content: Text('Başarılı'),
    backgroundColor: Colors.green,
  );
}

SnackBar SnackBarWhenFailure({required String snackBarFailureText}) {
  return SnackBar(
    content: Text(snackBarFailureText),
    backgroundColor: Colors.red,
  );
}
