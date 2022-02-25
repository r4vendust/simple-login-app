import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData? icon;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final bool isPass;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.icon,
      required this.hintText,
      required this.labelText,
      required this.textInputType,
      this.isPass = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: Colors.black87,
      ),
    );

    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
        border: inputBorder,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
