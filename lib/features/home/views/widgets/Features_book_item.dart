import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/book_model.dart';

class BookFeaturedItem extends StatelessWidget {
  const BookFeaturedItem({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: AspectRatio(
              aspectRatio: 150 / 224,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                errorWidget: (context, _, __) {
                  return const Icon(
                    Icons.error,
                    color: Colors.white,
                  );
                },
                imageUrl: books.image ?? '',
              ),
            )),
      ),
    );
  }
}



       // return Container(
    //   margin: const EdgeInsets.fromLTRB(20, 50, 5, 10),
    //   alignment: Alignment.topLeft,
    //   child: const Text(
    //     'Best Seller',
    //     style: TextStyle(
    //       color: Colors.white,
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //     ),
    //     ),