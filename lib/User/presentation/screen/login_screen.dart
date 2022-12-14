import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/utils/constants.dart';
import '../widgets/login_email_form.dart';
import '../widgets/login_with_widget.dart';
import 'signUP_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNum = '';
  final OtpFieldController controller = OtpFieldController();
  String otpCode = '';
  bool isLoginWithEmail = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(1),
                shape: MaterialStateProperty.all(
                  CircleBorder(),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
                alignment: Alignment.centerLeft,
                padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 26,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
        ),
        body: ScreenUtil().orientation == Orientation.landscape
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Center(
                            child: Image.asset(
                              'assets/images/login_welcome.png',
                              height: 80.h,
                              width: 120.w,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Text(
                          'Welcome Back !',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 300),
                        reverse: !isLoginWithEmail,
                        transitionBuilder:
                            (child, animation, secondaryAnimation) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType:
                                SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                        child: isLoginWithEmail
                            ? LoginEmailForm(
                                onBackPress: () => setState(() {
                                  isLoginWithEmail = false;
                                }),
                              )
                            : LoginWithWidget(
                                onEmailPress: () => setState(() {
                                  isLoginWithEmail = true;
                                }),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(
                        child: Image.asset(
                          'assets/images/login_welcome.png',
                          height: 70.h,
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Text(
                      'Welcome Back !',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 300),
                        reverse: !isLoginWithEmail,
                        transitionBuilder:
                            (child, animation, secondaryAnimation) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType:
                                SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                        child: isLoginWithEmail
                            ? LoginEmailForm(
                                onBackPress: () => setState(() {
                                  isLoginWithEmail = false;
                                }),
                              )
                            : LoginWithWidget(
                                onEmailPress: () => setState(() {
                                  isLoginWithEmail = true;
                                }),
                              ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }
}
