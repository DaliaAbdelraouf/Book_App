import 'package:flutter/material.dart';

class BookModel {
  final String? image;
  final String title;
  final String? author;
  final num? rating;
  final int? ratingCount;
  final List<dynamic>? category;

  BookModel(
      {this.image,
      this.category,
      @required required this.title,
      required this.author,
      @required this.rating,
      @required this.ratingCount});

  factory BookModel.fromJson(dynamic jsonData) {
    return BookModel(
      image: jsonData['volumeInfo']['imageLinks']?['smallThumbnail'],
      title: jsonData['volumeInfo']['title'],
      author: jsonData['volumeInfo']['authors']?[0] ?? "Unknown",
      rating: jsonData['volumeInfo']['averageRating'],
      ratingCount: jsonData['volumeInfo']['ratingsCount'],
      category: List<String>.from(
          jsonData['volumeInfo']['categories'] ?? ['Unknown']),
    );
  }
}
