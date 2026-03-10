import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? disabledAutovalidate;
  final bool? obscureText;
  final bool? enabled;
  final String? errorText;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final void Function(String?)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.disabledAutovalidate,
    this.obscureText = false,
    this.enabled = true,
    this.errorText,
    this.validator,
    this.onSaved,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      autovalidateMode: disabledAutovalidate == true
          ? null
          : AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        labelText: label,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabled: enabled ?? false,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
      textAlignVertical: TextAlignVertical.center,
    );
    // return Container(
    //   // decoration: BoxDecoration(
    //   //   shape: BoxShape.rectangle,
    //   //   color: Colors.grey[200],
    //   //   borderRadius: BorderRadius.circular(32),
    //   // ),
    //   child: TextFormField(
    //     autovalidateMode: disabledAutovalidate == true
    //         ? null
    //         : AutovalidateMode.onUserInteraction,
    //     obscureText: obscureText ?? false,
    //     onSaved: onSaved,
    //     validator: validator,
    //     decoration: InputDecoration(
    //       // contentPadding:
    //       //     const EdgeInsets.only(left: 11, right: 3, top: 5, bottom: 1),
    //       // errorBorder: const OutlineInputBorder(),
    //       // errorStyle: const TextStyle(
    //       //   height: 2,
    //       //   // fontSize: 9,
    //       // ),
    //       labelText: label,
    //       // border: InputBorder.none,
    //       border: const UnderlineInputBorder(),
    //       // enabled: true,
    //       prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
    //       suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
    //       hintText: hintText,
    //     ),
    //     textAlignVertical: TextAlignVertical.center,
    //   ),
    // );
  }
}
