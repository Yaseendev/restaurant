import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavor/flavor_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app/Shared/Rate/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant_app/User/blocs/account_bloc/account_bloc.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:restaurant_app/utils/constants.dart';

class EditAccountScreen extends StatefulWidget {
  final User user;
  const EditAccountScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  late Widget profilePic;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isMale = true;
  late Name name;
  late String email;
  late String phone;
  @override
  void initState() {
    profilePic = widget.user.photoUrl == null
        ? Image.asset(
            'assets/images/default_profile.png',
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          )
        : Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: Color(0xFFDADADA),
                )),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.user.photoUrl ?? '',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/default_profile.png',
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/default_profile.png',
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          );
    isMale = widget.user.gender?.toLowerCase() == 'male';
    name = Name(first: widget.user.name.first, last: widget.user.name.last);
    email = widget.user.email;
    phone = widget.user.phoneNumber ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBackBttn(context, 'Edit Account'),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 12),
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
                            children:
                                ListTile.divideTiles(context: context, tiles: [
                              ListTile(
                                leading: Icon(
                                  Icons.camera_alt_rounded,
                                  color: AppColors.PRIMARY_COLOR,
                                ),
                                title: Text('Take a photo'),
                                onTap: () async {
                                  final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.camera,
                                    preferredCameraDevice: CameraDevice.front,
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
                                  final XFile? photo = await _picker.pickImage(
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
          SizedBox(height: 50),
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
                  SizedBox(height: 10),
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
                          initialValue: name.first,
                          onChanged: (value) =>
                              setState(() => name.first = value),
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
                          initialValue: name.last,
                          onChanged: (value) =>
                              setState(() => name.last = value),
                          validator: (value) {
                            return (value!.isEmpty)
                                ? 'This field is required'
                                : null;
                          },
                        ),
                      ),
                    ],
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
                    initialValue: phone,
                    onChanged: (value) => setState(() => phone = value.trim()),
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
                              isMale = true;
                            });
                          },
                          icon: Icon(
                            Icons.male,
                            color:
                                isMale ? AppColors.PRIMARY_COLOR : Colors.black,
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
                                    borderRadius: BorderRadius.circular(100))),
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
                            color:
                                isMale ? Colors.black : AppColors.PRIMARY_COLOR,
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
                                    borderRadius: BorderRadius.circular(100))),
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
                        onPressed: name == widget.user.name &&
                                (isMale ? 'male' : 'female') ==
                                    widget.user.gender &&
                                phone == widget.user.phoneNumber
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final String gender =
                                      isMale ? 'male' : 'female';
                                  context
                                      .read<AccountBloc>()
                                      .add(UpdateUserEvent(
                                        name: name == widget.user.name
                                            ? null
                                            : name,
                                        gender: gender == widget.user.gender
                                            ? null
                                            : gender,
                                        phoneNum:
                                            phone == widget.user.phoneNumber
                                                ? null
                                                : phone,
                                      ));
                                }
                              },
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
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
    );
  }
}
