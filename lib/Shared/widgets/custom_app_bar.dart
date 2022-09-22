import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget appBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Text(title.toUpperCase()),
      titleTextStyle:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
      centerTitle: true,
      elevation: 4,
      toolbarHeight: 65,
    );
  }

  static PreferredSizeWidget appBarWithBackBttn(
      BuildContext context, String title) {
    return AppBar(
      leading: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            CircleBorder(),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
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
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Text(title.toUpperCase()),
      titleTextStyle:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black),
      centerTitle: true,
      elevation: 4,
      toolbarHeight: 65,
    );
  }
}
