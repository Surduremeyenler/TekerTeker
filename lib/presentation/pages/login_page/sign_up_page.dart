import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/sign_up/sign_up_cubit.dart';
import 'package:teker_teker/presentation/forms/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignUpCubit(),
        child: const SignUpForm(),
      ),
    );
  }
}
