import 'package:flutter/material.dart';

import '../../../../utils/book_api_service.dart';
import 'best_seller_list_item.dart';
import 'best_seller_view.dart';

class FeaturedBestSellerListViewFutureBuilder extends StatelessWidget {
  const FeaturedBestSellerListViewFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BookApiService.fetchNewBooks(),
      builder: (context, snapshot) {
        //to check the error we use snapshot
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BestSellerView(
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
