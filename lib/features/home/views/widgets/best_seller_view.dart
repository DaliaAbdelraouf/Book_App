import 'package:bookly_app/features/home/views/widgets/best_seller_list_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../models/book_model.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true, //builds every children all at once
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BestSellerListViewItem(book: books[index]);
        });
  }
}
