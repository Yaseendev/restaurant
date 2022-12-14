import 'dart:io';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:get/get_utils/get_utils.dart';

class SignUPscreen extends StatefulWidget {
  const SignUPscreen({Key? key}) : super(key: key);

  @override
  State<SignUPscreen> createState() => _SignUPscreenState();
}

class _SignUPscreenState extends State<SignUPscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isMale = true;
  final ImagePicker _picker = ImagePicker();
  Widget profilePic = Image.asset(
    'assets/images/default_profile.png',
    fit: BoxFit.fill,
    alignment: Alignment.topCenter,
  );
  String email = '';
  String password = '';
  String confPassword = '';
  bool passwordVisible = true;
  String phoneNum = '';
  String firstName = '';
  String lastName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  profilePic,
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<XFile?>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: const Radius.circular(20),
                            ),
                          ),
                          elevation: 2,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: ListTile.divideTiles(
                                  context: context,
                                  tiles: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.camera_alt_rounded,
                                        color: AppColors.PRIMARY_COLOR,
                                      ),
                                      title: Text('Take a photo'),
                                      onTap: () async {
                                        final XFile? photo =
                                            await _picker.pickImage(
                                          source: ImageSource.camera,
                                          preferredCameraDevice:
                                              CameraDevice.front,
                                        );
                                        Navigator.of(context).pop(photo);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.photo_rounded,
                                        color: AppColors.PRIMARY_COLOR,
                                      ),
                                      title: Text('Choose from gallery'),
                                      onTap: () async {
                                        final XFile? photo =
                                            await _picker.pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        Navigator.of(context).pop(photo);
                                      },
                                    ),
                                  ]).toList(),
                            );
                          },
                        ).then((image) {
                          if (image != null) {
                            setState(() {
                              profilePic = Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Color(0xFFDADADA),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipOval(
                                    child: Image.file(
                                      File(image.path),
                                      width: 160,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            });
                          }
                        });
                      },
                      child: Image.asset(
                        'assets/images/edit.png',
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.badge_outlined,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              hintText: 'First Name',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            onChanged: (value) => firstName = value,
                            validator: (value) {
                              return (value!.isEmpty)
                                  ? 'This field is required'
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              hintText: 'Last Name',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            onChanged: (value) => lastName = value,
                            validator: (value) {
                              return (value!.isEmpty)
                                  ? 'This field is required'
                                  : null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'E-mail',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      onChanged: (value) => email = value,
                      validator: (value) {
                        return !GetUtils.isEmail(value ?? '')
                            ? 'Please enter a valid email'
                            : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.password,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        filled: true,
                        fillColor: Colors.white,
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
                      onChanged: (pass) {
                        password = pass;
                      },
                      obscureText: passwordVisible,
                      onEditingComplete: () {
                        // FocusScope.of(context).unfocus();
                        // if (_formKey.currentState!.validate() &&
                        //     !(context.read<LoginBloc>().state is LoginLoading)) {
                        //   context.read<LoginBloc>().add(LoginUserEvent(
                        //       userCred:
                        //           int.tryParse(_email.characters.first) == null
                        //               ? _email
                        //               : _email.padLeft(10, '00963'),
                        //       password: _password));
                        // }
                      },
                      validator: (value) {
                        return value!.trim().isNotEmpty
                            ? value.trim().length >= 8
                                ? null
                                : 'Password must be longer than 7 characters'
                            : 'This field is required';
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        //labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        filled: true,
                        fillColor: Colors.white,
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
                      onChanged: (pass) {
                        confPassword = pass;
                      },
                      obscureText: passwordVisible,
                      onEditingComplete: () {},
                      validator: (value) {
                        return value!.trim().isNotEmpty
                            ? value == password
                                ? null
                                : 'Passwords did not match'
                            : 'This field is required';
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      maxLength: 11,
                      onChanged: (value) => phoneNum = value.trim(),
                      validator: (value) {
                        return value!.length < 11
                            ? 'Please enter a valid phone number'
                            : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.venusMars,
                          color: AppColors.PRIMARY_COLOR,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  isMale = true;
                                });
                              });
                            },
                            icon: Icon(
                              Icons.male,
                              color: isMale
                                  ? AppColors.PRIMARY_COLOR
                                  : Colors.black,
                            ),
                            label: Text(
                              'Male',
                              style: TextStyle(
                                color: isMale
                                    ? AppColors.PRIMARY_COLOR
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 18)),
                              side: MaterialStateProperty.all(BorderSide(
                                color: isMale
                                    ? AppColors.PRIMARY_COLOR
                                    : Colors.grey,
                                width: .5,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            icon: Icon(
                              Icons.female,
                              color: isMale
                                  ? Colors.black
                                  : AppColors.PRIMARY_COLOR,
                            ),
                            label: Text(
                              'Female',
                              style: TextStyle(
                                color: isMale
                                    ? Colors.black
                                    : AppColors.PRIMARY_COLOR,
                                fontSize: 16,
                              ),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 18)),
                              side: MaterialStateProperty.all(BorderSide(
                                color: isMale
                                    ? Colors.grey
                                    : AppColors.PRIMARY_COLOR,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // /SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 30),
                      child: Center(
                        child: ElevatedButton(
                          child: Text(
                            'CONFIRM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AccountBloc>(context)
                                  .add(RegisterUserEvent(
                                name: Name(
                                  first: firstName,
                                  last: lastName,
                                ),
                                password: password,
                                phoneNum: phoneNum,
                                email: email,
                                gender: isMale ? 'male' : 'female',
                              ));
                            }
                          },
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 35)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
