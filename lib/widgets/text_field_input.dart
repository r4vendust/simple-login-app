import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData? icon;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final bool isPass;
  final String? Function(String?)? validator;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.icon,
      required this.hintText,
      required this.labelText,
      required this.textInputType,
      this.isPass = false,
      this.validator,});

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
      validator: validator,
    );
  }
}
