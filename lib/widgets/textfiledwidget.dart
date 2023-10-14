import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    super.key,
    required this.hintText,
    this.controller,
    required this.obscureText,
    required this.borderRadius,
    required this.validator,
    this.onChanged,
    required this.keyboardType,
    this.onpressed,
    this.iconButton,
  });

  //! add variable :
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final BorderRadius borderRadius;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData? iconButton;
  final VoidCallback? onpressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          fillColor: const Color.fromARGB(255, 155, 152, 152),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 15.sp,
          ),
          suffixIcon: IconButton(
            onPressed: onpressed,
            icon: Icon(
              iconButton,
            ),
          ),
        ),
      ),
    );
  }
}
