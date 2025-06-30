import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/widgets/logo_app.dart';

AppBar buildAppBar(BuildContext context, {bool isGoBack = true}) {
  return AppBar(
    elevation: 0,
    title: const LogoApp(),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading:
        isGoBack
            ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: kSecondaryColor),
            )
            : null,
  );
}
