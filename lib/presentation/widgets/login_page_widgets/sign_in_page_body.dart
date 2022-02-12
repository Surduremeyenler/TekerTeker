import 'package:flutter/material.dart';

import 'package:teker_teker/presentation/pages/login_page/fade_animation.dart';
import 'package:teker_teker/presentation/widgets/login_page_widgets/sign_in_page_widgets.dart';

class SignInPageBody extends StatelessWidget {
  const SignInPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/tekerteker_login.jpeg'),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 92, 3, 0),
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(71, 92, 3, 0),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.25,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 236, 236, 236)))),
                                        child: EmailInputField(),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(),
                                          child: PasswordInputField()),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Login(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: ForgotPassword()),
                            Expanded(child: SignUpButton(context)),
                          ],
                        ),
                        FadeAnimation(
                            1.7,
                            Text(
                              "Continue with social media",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        SignInWithGoogle(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
