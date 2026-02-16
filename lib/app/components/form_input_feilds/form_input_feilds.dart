import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormTextField extends StatefulWidget {
  final String name;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  const AppFormTextField({
    super.key,
    required this.name,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AppFormTextField> createState() => _AppFormTextFieldState();
}

class _AppFormTextFieldState extends State<AppFormTextField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: widget.isPassword ? _obscured : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
        )
            : null,
      ),
    );
  }
}
