import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/row_text_with_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../constance.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../home/data/models/home_model/BooksModel.dart';

class MiddleTexts extends StatelessWidget {
  const MiddleTexts({super.key,required this.model});
  final VolumeInfo? model;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
           Text(
            textAlign:TextAlign.center,
            ( model?.title??"").toString(),style: const TextStyle(fontSize: 30,fontFamily: kGTFont,fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8,),
          Text((model?.publisher??"").toString(),style: StyleManager.textStyle18.copyWith(color: Colors.grey),),
          const SizedBox(height: 8,),
        const RowTextWithIcon(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
