import 'package:custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/User/presentation/screen/signUP_screen.dart';

class LoginEmailForm extends StatefulWidget {
  final VoidCallback onBackPress;
  const LoginEmailForm({
    super.key,
    required this.onBackPress,
  });

  @override
  State<LoginEmailForm> createState() => _LoginEmailFormState();
}

class _LoginEmailFormState extends State<LoginEmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            //autofocus: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            onChanged: (value) => email = value,
            validator: (value) {
              return !GetUtils.isEmail(value ?? '')
                  ? 'Please enter a valid email'
                  : null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
              hintText: 'Password',
              labelText: 'Password',
              prefixIcon: Icon(Icons.password),
              suffixIcon: passwordVisible
                  ? IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () => setState(() {
                        passwordVisible = false;
                      }),
                    )
                  : IconButton(
                      onPressed: () => setState(() {
                        passwordVisible = true;
                      }),
                      icon: const Icon(Icons.visibility_off),
                    ),
            ),
            keyboardType: TextInputType.visiblePassword,
            maxLines: 1,
            onChanged: (value) => password = value,
            obscureText: passwordVisible,
            validator: (value) {
              return value!.trim().isNotEmpty
                  ? value.trim().length >= 8
                      ? null
                      : 'Password must be longer than 7 characters'
                  : 'This field is required';
            },
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                child: Text(
                  'BACK',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                onPressed: widget.onBackPress,
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 35)),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AccountBloc>().add(
                        LoginWithEmailEvent(email: email, password: password));

                    // Future.delayed(Duration(seconds: 5))
                    //     .then((value) => controller.setFocus(0));
                    /*showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          scrollable: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          content: Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text:
                                      'We sent a code to verify yor phone\n(+20) ',
                                  children: [
                                    // TextSpan(
                                    //     text: phoneNum,
                                    //     style: TextStyle(
                                    //       color:
                                    //           AppColors.PRIMARY_COLOR,
                                    //       fontWeight: FontWeight.bold,
                                    //     )),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Center(
                                  child: Image.asset(
                                'assets/images/codeLogo.png',
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              )),
                              SizedBox(height: 8),
                              Text(
                                'Enter your verification code',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              OTPTextField(
                                keyboardType: TextInputType.number,
                                length: 5,
                                width: double.maxFinite,
                                fieldWidth: 45,
                                //controller: controller,
                                otpFieldStyle: OtpFieldStyle(
                                  borderColor: Colors.black,
                                ),
                                //hasError: otpFieldError,
                                onChanged: (value) {
                                  //otpCode = value;
                                },
                                onCompleted: (code) {
                                  // FocusScope.of(context).requestFocus(passwordNode);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (ctx) => SignUPscreen()));
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );*/
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 35)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CustomText(
            'Don\'t have an account? [Create One]()',
            definitions: [
              SelectiveDefinition(
                matcher: const LinkMatcher(),
                labelSelector: (groups) => groups[0]!,
                tapSelector: (groups) => groups[1]!,
              ),
            ],
            matchStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            tapStyle: const TextStyle(),
            onTap: (_, text) => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return SignUPscreen();
            })),
          ),
        ],
      ),
    );
  }
}
