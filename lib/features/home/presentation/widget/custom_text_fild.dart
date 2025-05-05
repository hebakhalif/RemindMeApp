import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  //final bool obscureText;
  final IconData? icon;
  final TextInputType keyboardType;
  final double cursorWidth1 ;
  final double heights;
  final double widths;
  const Customtextfield({
    super.key,
    this.controller,
     required this.hintText,
    this.icon,
    required this.keyboardType,
    required this.cursorWidth1,
    required this.heights,
    required this.widths,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height:heights ,
      width:widths,
      child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          cursorWidth: cursorWidth1,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            hintText: hintText,
           prefixIcon: SizedBox(width: 30.w,),
            // ignore: unnecessary_null_comparison
            filled: true,
            fillColor: const Color.fromARGB(255, 239, 234, 234),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
          )),
    );
  }
}