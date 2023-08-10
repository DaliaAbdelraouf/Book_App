import 'package:bookly_app/features/home/views/widgets/featured_best_seller_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../models/book_model.dart';
import 'Featured_books_view_futurebuilder.dart';
import 'home_view_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> books;
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeViewAppBar(),
        ),
        SliverToBoxAdapter(
          child: FeaturedListViewFutureBuilder(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 48.0, left: 20),
            child: Text(
              'Best Seller',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FeaturedBestSellerListViewFutureBuilder(),
        ),
      ],
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
