import '../../../../utils/book_api_service.dart';
import 'best_seller_list_item.dart';
import 'featured_books_list_view.dart';
import 'package:flutter/material.dart';

class FeaturedListViewFutureBuilder extends StatelessWidget {
  const FeaturedListViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BookApiService.fetchFeatureBooks(),
      builder: (context, snapshot) {
        //to check the error we use snapshot
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FeaturedBooKListView(
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
