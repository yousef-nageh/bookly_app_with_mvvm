
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



import '../../../../../core/widget/image_error.dart';
import '../../../data/models/home_model/BooksModel.dart';

class BooksItem extends StatelessWidget {

  final VolumeInfo? model;

  const BooksItem({super.key,  this.model});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Hero(

      tag: (model?.pageCount??"0").toString(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: h * 0.3,
          child: AspectRatio(
            aspectRatio: 1.3 / 2,
            child: CachedNetworkImage(

              fit: BoxFit.fill,
              imageUrl: (model?.imageLinks?.thumbnail??"https://cdn.waterstones.com/bookjackets/large/9780/7126/9780712676090.jpg").toString(),
              errorWidget: (context, url, error) =>
              const ImageError(borderRadius: 20,),
            ),
          ),
        ),
      ),
    );
  }
}
