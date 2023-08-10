import 'package:flutter/material.dart';
import '../../../../models/book_model.dart';
import 'Features_book_item.dart';
import 'book_details_view.dart';

class FeaturedBooKListView extends StatelessWidget {
  const FeaturedBooKListView({super.key, required this.books});

  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    final bookWidth =
        MediaQuery.of(context).size.width * 0.5; // Width of a single book
    const spacing = 5.0;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
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

        // Align(
        //   alignment: Alignment.topLeft,
        //   child: SizedBox(
        //     height: MediaQuery.of(context).size.width * 1.1,
        //     width: 400,
        //     child: ListView.builder(
        //       scrollDirection: Axis.vertical,
        //       itemCount: books.length,
        //       itemExtent: bookWidth + spacing, // set itemExtent
        //       itemBuilder: (context, index) {
        //         final book = books[index];

        //         return Padding(
        //           padding: const EdgeInsets.only(bottom: 10.0),
        //           child: Row(
        //             children: [
        //               BookFeaturedItem(book: book),
        //               Column(
        //                 children: [
        //                   Flexible(
        //                     child: Container(
        //                       child: Text(
        //                         book.title,
        //                         maxLines: 3,
        //                         style: const TextStyle(
        //                           fontSize: 15.0,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
