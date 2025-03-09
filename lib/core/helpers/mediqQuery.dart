import 'package:flutter/material.dart';

extension MediqQueryHelper on BuildContext{
  
  double get screenHeighe => MediaQuery.of(this).size.height;

   double get screenWidth => MediaQuery.of(this).size.width;
   double get bottomInset => MediaQuery.of(this).viewInsets.bottom; 

}  
