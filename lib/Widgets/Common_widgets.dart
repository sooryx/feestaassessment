import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonWidgets {
  static Widget CustomTextField({
    int? maxLength,
    required BuildContext context,
    int? maxLines,
    required String hintText,
    required bool obscureText,
    TextStyle? hintstyle,
    Icon? icon,
    Icon? picon,
    TextEditingController? controller,
    FocusNode? focusNode,
    required BorderRadius borderRadius,
  }) {
    return TextField(
      textAlign: TextAlign.start,
      style: hintstyle ?? const TextStyle(color: Colors.white),
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintstyle ?? const TextStyle(color: Colors.white),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        suffixIcon: icon,
        prefixIcon: picon,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(width: 0.5, color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.5, color: Theme.of(context).primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide:
              BorderSide(width: 0.5, color: Theme.of(context).primaryColor),
        ),
      ),
      obscureText: obscureText,
    );
  }
}

typedef Validator = String? Function(String? value);

// class MyDropdown extends StatelessWidget {
//   final String hintText;
//   final double buttonWidth;
//   final double buttonHeight;
//   final List<String> items;
//   final String? selectedValue;
//   final void Function(String?) onChanged;
//
//   const MyDropdown({
//     required this.hintText,
//     required this.items,
//     required this.selectedValue,
//     required this.onChanged,
//     Key? key, required this.buttonWidth, required this.buttonHeight,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
