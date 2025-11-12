import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String? errorText;
  TextInputType? textInputType;
  IconData icon;
  Function(String text)? onChanged;
  String? Function(String?)? validator;
  bool isPassword = false;
  String? initialValue;
  Color? color;
  DefaultTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.errorText,
    this.validator,
    this.isPassword = false,
    this.initialValue,
    this.color = Colors.white,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      initialValue: initialValue,
      onChanged: (text) {
        onChanged!(text);
      },
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: color)),
        prefixIcon: Icon(icon, color: color),
        errorText: errorText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
      ),
      style: TextStyle(color: color),
    );
  }
}
