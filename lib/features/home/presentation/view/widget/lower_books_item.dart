
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:bookly_app_with_mvvm/features/home/data/models/home_model/BooksModel.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/row_text_with_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../../../config/routes/routes.dart';
import '../../../../../constance.dart';
import '../../../../../core/widget/image_error.dart';

class LowerBooksItem extends StatelessWidget {
  const LowerBooksItem({
    super.key,
    required this.model,
  });

  final VolumeInfo? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        height: 120,
        child: InkWell(
          onTap: () {
            context.navigateTo(arguments:model, pageName: AppRoutes.bookDetailsViewRoute );
          },
          child: Row(
            children: [
              Hero(
                tag: (model?.pageCount??"0").toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: 120,
                    width: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const ImageError(
                        borderRadius: 20,
                      ),
                      imageUrl: (model?.imageLinks?.smallThumbnail ??
                              "https://cdn.waterstones.com/bookjackets/large/9780/7126/9780712676090.jpg")
                          .toString(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        (model?.title).toString(),
                        style: const TextStyle(
                          height: 1.2,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: "GTFont"),
                      ),

                      Text(
                        maxLines: 1,
                        getAuthors(),
                        style: StyleManager.textStyle14,
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "free ",
                            style: StyleManager.textStyle15,
                          ),

                          RowTextWithIcon(),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  String getAuthors(){
    if(model?.authors?.isEmpty==true){
      return( model?.publisher??"").toString();
    }else{
      return ( model?.authors?[0]).toString();
    }
  }
}
