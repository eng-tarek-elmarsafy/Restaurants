import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/widgets/logo_app.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const LogoApp(),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios, color: kSecondaryColor),
    ),
  );
}
