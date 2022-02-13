import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/auth/auth_cubit.dart';
import 'package:teker_teker/presentation/pages/login_page/landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1700), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => AuthCubit(),
                    child: AuthLandingPage(),
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash.jpeg'),
      ),
    );
  }
}
