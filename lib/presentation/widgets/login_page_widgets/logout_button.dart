import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/login/login_cubit.dart';

Widget LogOutButton() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(100),
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                disabledColor: Colors.blueAccent.withOpacity(0.6),
                color: Colors.blueAccent,
                onPressed: () => context.read<LoginCubit>().signOut(),
                child: const Text('Logout')),
          );
        },
      )
    ],
  );
}
