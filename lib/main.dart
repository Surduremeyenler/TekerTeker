import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:teker_teker/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teker Teker',
        home: Builder(builder: (context) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
              child: const SplashPage());
        }));
  }
}
