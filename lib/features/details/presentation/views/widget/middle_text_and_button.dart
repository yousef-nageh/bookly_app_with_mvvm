import 'package:flutter/material.dart';

import '../../../../home/data/models/home_model/BooksModel.dart';
import 'middle_button.dart';
import 'middle_texts.dart';

class MiddleTextAndButton extends StatelessWidget {
  final Widget child;
  const MiddleTextAndButton({super.key, required this.child, required this.model});
  final VolumeInfo? model;

  @override
  Widget build(BuildContext context) {
    return Column (children: [
       MiddleTexts(model: model,),
     child,
       MiddleButton(model: model,),
    ],);
  }
}
