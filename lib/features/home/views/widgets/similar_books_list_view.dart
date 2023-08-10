import 'package:flutter/material.dart';
import '../../../../models/book_model.dart';
import 'Features_book_item.dart';
import 'book_details_view.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key, required this.books});

  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    final bookWidth =
        MediaQuery.of(context).size.width * 0.3; // Width of a single book
    const spacing = 5.0;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.16,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            // itemExtent: bookWidth + spacing,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  var currentBook = books[index];
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BookViewDetails(
                        book: currentBook,
                      );
                    },
                  ));
                },
                child: BookFeaturedItem(
                  books: books[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
