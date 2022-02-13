import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:teker_teker/application/sign_up/sign_up_cubit.dart';
import 'package:teker_teker/domain/auth_models/auth_text_field.dart';
import 'package:teker_teker/domain/auth_models/name.dart';
import 'package:teker_teker/domain/auth_models/email.dart';
import 'package:teker_teker/domain/auth_models/password.dart';
import 'package:teker_teker/domain/auth_models/re_password.dart';

Widget SignUpText() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Text(
      "Üye Ol Ve Teker Teker'e Katıl!",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(218, 75, 75, 75)),
    ),
  );
}

Widget NameInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return AuthTextField(
          padding: const EdgeInsets.symmetric(vertical: 10),
          hint: 'Ad-Soyad',
          keyboardType: TextInputType.name,
          error: state.name.error?.name,
          onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
        );
      });
}

Widget EmailInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextField(
          padding: const EdgeInsets.symmetric(vertical: 10),
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          error: state.email.error?.name,
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
        );
      });
}

Widget PasswordInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
    builder: (context, state) {
      return AuthTextField(
        padding: const EdgeInsets.symmetric(vertical: 10),
        hint: 'Şifre',
        isPasswordField: true,
        keyboardType: TextInputType.text,
        error: state.password.error?.name,
        onChanged: (password) =>
            context.read<SignUpCubit>().passwordChanged(password),
      );
    },
  );
}

Widget RePasswordInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
    builder: (context, state) {
      return AuthTextField(
        padding: const EdgeInsets.symmetric(vertical: 10),
        hint: 'Şifre Tekrarı',
        isPasswordField: true,
        keyboardType: TextInputType.text,
        error: state.rePassword.error?.name,
        onChanged: (rePassword) =>
            context.read<SignUpCubit>().rePasswordChanged(rePassword),
      );
    },
  );
}

Widget SignUp(BuildContext context) {
  return BlocBuilder<SignUpCubit, SignUpState>(
    builder: (context, state) {
      return state.displaySignUpButton
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Opacity(
                  opacity: 1,
                  child: SignInButton(Buttons.Email,
                      mini: false, text: 'Email ile kayıt ol!', onPressed: () {
                    context.read<SignUpCubit>().signUpWithCredentials();
                    Navigator.pop(context);
                  })))
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Opacity(
                  opacity: 0.4,
                  child: SignInButton(Buttons.Email,
                      mini: false,
                      text: 'Email ile kayıt ol!',
                      onPressed: () {})));
    },
  );
}

Widget SignInTextButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text(
      'Hesabın Var mı? Giriş Yap!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );
}
