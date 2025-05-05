import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 40,
                width: 500,
                child: CupertinoSearchTextField(
                  placeholder: "search task".tr(), // ✅ "Search Task"
                  placeholderStyle: TextStyle(color: Colors.grey),
                  backgroundColor: const Color.fromARGB(208, 255, 255, 255),
                ),
              ),
    );
  }
}