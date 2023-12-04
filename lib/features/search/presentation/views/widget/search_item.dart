import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constance.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widget/image_error.dart';
import '../../../../home/data/models/home_model/BooksModel.dart';
import '../../../../home/presentation/view/widget/row_text_with_icon.dart';

class SearchItem extends StatelessWidget {
  final VolumeInfo? model;
  const SearchItem({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            ClipRRect(
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
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      (model?.title).toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: "GTFont"),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      (model?.authors?[0]).toString(),
                      style: StyleManager.textStyle14,
                    ),
                    const Spacer(),
                     const Row(
                      children: [
                        Text(
                          "free ",
                          style: StyleManager.textStyle15,
                        ),
                        Spacer(),
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
    );
  }
}
