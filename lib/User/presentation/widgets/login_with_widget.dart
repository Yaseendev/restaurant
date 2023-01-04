import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';

import '../screen/signUP_screen.dart';

class LoginWithWidget extends StatelessWidget {
  final VoidCallback onEmailPress;
  const LoginWithWidget({
    required this.onEmailPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextFormField(
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(100)),
        //     hintText: 'Phone Number',
        //     prefixIcon: Icon(Icons.phone_in_talk_outlined),
        //   ),
        //   autofocus: false,
        //   keyboardType: TextInputType.phone,
        //   maxLines: 1,
        //   maxLength: 11,
        //   onChanged: (value) => phoneNum = value,
        //   validator: (value) {
        //     return (value!.length < 10 ||
        //             int.tryParse(value) == null)
        //         ? 'Please enter a valid phone number'
        //         : null;
        //   },
        // ),
        Row(
          children: [
            Expanded(child: Divider()),
            Text(
              ' Login With ',
              style: TextStyle(
                fontSize: ScreenUtil().orientation == Orientation.landscape
                    ? 9.sp
                    : 12.sp,
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton.icon(
            onPressed: () {
              GoogleSignIn(
                      scopes: [
                        'email',
                        'https://www.googleapis.com/auth/contacts.readonly',
                      ],
                     )
                  .signIn()
                  .then((value) => print(value));
            },
            icon: Icon(FontAwesomeIcons.google,
            color: Colors.white,
            ),
            label: Text(
              'Google',
              style: TextStyle(
                fontSize: ScreenUtil().orientation == Orientation.landscape
                    ? 10.sp
                    : 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Color(0xFFE6242E)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<AccountBloc>().add(LoginWithFacebookEvent());
            },
            icon: Icon(FontAwesomeIcons.facebookF,
            color: Colors.white,
            ),
            label: Text(
              'Facebook',
              style: TextStyle(
                fontSize: ScreenUtil().orientation == Orientation.landscape
                    ? 10.sp
                    : 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFF4267B2)),
              padding: MaterialStateProperty.all(EdgeInsets.all(16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton.icon(
            onPressed: () async {
              // await FacebookAuth.i.logOut();
              onEmailPress();
            },
            icon: Icon(Icons.email,
            color: Colors.white,
            ),
            label: Text(
              'E-mail',
              style: TextStyle(
                fontSize: ScreenUtil().orientation == Orientation.landscape
                    ? 10.sp
                    : 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0XFF293462)),
              padding: MaterialStateProperty.all(EdgeInsets.all(16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
            ),
          ),
        ),

        SizedBox(height: 25),
        // ElevatedButton(
        //   child: Text(
        //     'LOGIN',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //   ),
        //   onPressed: () {
        //     if (_formKey.currentState!.validate()) {
        //       // Future.delayed(Duration(seconds: 5))
        //       //     .then((value) => controller.setFocus(0));
        //       showDialog(
        //         context: context,
        //         barrierDismissible: false,
        //         builder: (context) {
        //           return AlertDialog(
        //             scrollable: true,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(36),
        //             ),
        //             content: Column(
        //               children: [
        //                 Text.rich(
        //                   TextSpan(
        //                     text:
        //                         'We sent a code to verify yor phone\n(+20) ',
        //                     children: [
        //                       TextSpan(
        //                           text: phoneNum,
        //                           style: TextStyle(
        //                             color:
        //                                 AppColors.PRIMARY_COLOR,
        //                             fontWeight: FontWeight.bold,
        //                           )),
        //                     ],
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //                 Center(
        //                     child: Image.asset(
        //                   'assets/images/codeLogo.png',
        //                   alignment: Alignment.center,
        //                   fit: BoxFit.fill,
        //                 )),
        //                 SizedBox(height: 8),
        //                 Text(
        //                   'Enter your verification code',
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 OTPTextField(
        //                   keyboardType: TextInputType.number,
        //                   length: 5,
        //                   width: double.maxFinite,
        //                   fieldWidth: 45,
        //                   controller: controller,
        //                   otpFieldStyle: OtpFieldStyle(
        //                     borderColor: Colors.black,
        //                   ),
        //                   //hasError: otpFieldError,
        //                   onChanged: (value) {
        //                     otpCode = value;
        //                   },
        //                   onCompleted: (code) {
        //                     // FocusScope.of(context).requestFocus(passwordNode);
        //                     Navigator.of(context)
        //                         .pushReplacement(
        //                             MaterialPageRoute(
        //                                 builder: (ctx) =>
        //                                     SignUPscreen()));
        //                   },
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        //   style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all(Colors.black),
        //     shape: MaterialStateProperty.all(
        //         RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(100),
        //     )),
        //     padding: MaterialStateProperty.all(
        //         EdgeInsets.symmetric(
        //             vertical: 12, horizontal: 35)),
        //   ),
        // ),
        SizedBox(height: 45),
        // Row(
        //   children: [
        //     Expanded(child: Divider()),
        //     Text(' Or Continue Using '),
        //     Expanded(child: Divider()),
        //   ],
        // ),
        // SizedBox(height: 25),
        // Row(
        //   children: [
        //     Expanded(
        //       child: ElevatedButton.icon(
        //         onPressed: () {},
        //         icon: Icon(FontAwesomeIcons.facebookF),
        //         label: Text(
        //           'Facebook',
        //           style: TextStyle(
        //             fontSize: 15.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         style: ButtonStyle(
        //           backgroundColor: MaterialStateProperty.all(
        //               Color(0xFF4267B2)),
        //           padding: MaterialStateProperty.all(
        //               EdgeInsets.all(16)),
        //           shape: MaterialStateProperty.all(
        //               RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //           )),
        //         ),
        //       ),
        //     ),
        //     SizedBox(width: 15),
        //     Expanded(
        //       child: ElevatedButton.icon(
        //         onPressed: () {},
        //         icon: Icon(FontAwesomeIcons.google),
        //         label: Text(
        //           'Google',
        //           style: TextStyle(
        //             fontSize: 15.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         style: ElevatedButton.styleFrom(
        //           padding: const EdgeInsets.all(16),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
