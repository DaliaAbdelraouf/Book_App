import 'package:bookly_app/features/home/views/widgets/similar_books_future_builder.dart';
import 'package:bookly_app/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookViewDetails extends StatelessWidget {
  const BookViewDetails({super.key, required this.book});
  static const String id = ' BookViewDetails ';
//card
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        //relative width and height of the device
                        width: MediaQuery.of(context).size.width * .40,
                        // height: 300,
                        child: AspectRatio(
                          aspectRatio: 150 / 244,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            errorWidget: (context, _, __) {
                              return const Icon(
                                Icons.error,
                                color: Colors.white,
                              );
                            },
                            imageUrl: book.image ?? '',
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 20),
                    // const SizedBox(height: 3),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Column(children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            child: Text(
                              book.title,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 9),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            child: Text(
                              book.author ?? 'author',
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(173, 0, 0, 0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  child: Text(
                                    book.rating?.toString() ?? '0',
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16,
                                  ),
                                  child: Text(
                                    " (${book.ratingCount?.toString() ?? '0'})",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 300,
                            // height: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                    ),
                                    child: const Text(
                                      'Price',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                    child: const Text('free preview'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
                              child: Text(
                                'You Can also like',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                           Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: SimilarBooksFutureBuilder(
                              book: book,
                            ),
                          )
                        ]))
                  ],
                ),
              ),
            ],
          ))
    ]));
  }
}
