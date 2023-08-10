import 'package:bookly_app/features/home/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/models/book_model.dart';

import '../../../../utils/book_api_service.dart';

import 'package:flutter/material.dart';

class SimilarBooksFutureBuilder extends StatelessWidget {
  const SimilarBooksFutureBuilder({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BookApiService.fetchSimilarBooks(book.category![0]),
      builder: (context, snapshot) {
        //to check the error we use snapshot
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SimilarBookListView(
              books: snapshot.data!,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return Text(
            snapshot.error.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
