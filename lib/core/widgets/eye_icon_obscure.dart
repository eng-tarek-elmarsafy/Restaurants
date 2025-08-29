import 'package:flutter/material.dart';
import '../../constrains.dart';

class EyeIconObscure extends StatefulWidget {
  const EyeIconObscure({super.key, required this.onChange});

  final Function(bool value) onChange;

  @override
  State<EyeIconObscure> createState() => _EyeIconObscureState();
}

class _EyeIconObscureState extends State<EyeIconObscure> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
          widget.onChange(obscureText);
        });
      },
      icon:
          obscureText
              ? const Icon(Icons.visibility_off, color: kPrimaryColor)
              : const Icon(Icons.remove_red_eye, color: kPrimaryColor),
    );
  }
}
