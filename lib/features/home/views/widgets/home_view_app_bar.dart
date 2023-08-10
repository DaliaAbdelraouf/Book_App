import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppImages.Klogo, height: 18),
          IconButton(
            icon: const Icon(Icons.search,
                color: Colors.white), // add the search icon
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
