import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:teker_teker/application/login/login_cubit.dart';

Widget ProfilePageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          context.read<LoginCubit>().signOut();
        },
      ),
    ],
  );
}
