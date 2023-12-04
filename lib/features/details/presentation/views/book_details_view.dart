import 'package:bookly_app_with_mvvm/features/details/presentation/views/widget/book_details_body.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/home_model/BooksModel.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.model});
  final VolumeInfo? model;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:BookDetailsBody(model: model,) ,
    );
  }
}
