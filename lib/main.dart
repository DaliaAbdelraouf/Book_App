import 'package:bookly_app/models/book_model.dart';

import 'package:bookly_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'features/home/views/home_view.dart';
import 'features/home/views/widgets/book_details_view.dart';
import 'features/splash/views/splash_view.dart';

void main() async {

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kprimarycolor,
      ),
      routes: {
        SplashView.id: (context) => const SplashView(),
        HomeView.id: (context) => const HomeView(),
        // BookViewDetails.id: (context) => const BookViewDetails(),
      },
      initialRoute: SplashView.id,

    );
  }
}
