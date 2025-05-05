import 'package:flutter/material.dart';
import 'package:point_ease/core/themes/app_colors.dart';
import 'package:point_ease/features/change_language/presentation/dialogs/language_dialog.dart';
class LanguageButton extends StatelessWidget{
  const LanguageButton({super.key, });
  @override

  Widget build(BuildContext context) {
    return IconButton(
          onPressed: ()=> LanguageDialog.show(context),
          icon: Icon(Icons.language , color:AppColors.primaryColorgreen),
        );
  }
}