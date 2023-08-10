import 'package:dio/dio.dart';

import '../models/book_model.dart';

abstract class BookApiService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1';
  static Future<List<BookModel>> fetchFeatureBooks() async {
    try {
      final dio = Dio();

      var response = await dio.get('$_baseUrl/volumes?q=programming');

      List<BookModel> books = parseData(response);
      return books;
    } catch (e) {
      if (e is DioError) {
        //?>> ....
        var errMessage = e.response?.data['error']['error'] ??
            'something went wrong try later'; // if the value on the left is null get the string to the error message
        throw Exception("something went wrong ");
      }
      throw Exception("something went wrong ");
    }
  }

  static Future<List<BookModel>> fetchNewBooks() async {
    final dio = Dio();

    var response =
        await dio.get('$_baseUrl/volumes?Sorting=newest &q=computer science');

    List<BookModel> books = parseData(response);
    return books;
  }


  static Future<List<BookModel>> fetchSimilarBooks(String category) async {
    try {
      final dio = Dio();
      var response = await dio.get('$_baseUrl/volumes?q=$category');

      List<BookModel> books = parseData(response);
      return books;
    } catch (e) {
      if (e is DioError) {
        // checking the type
        var errMessage = e.response?.data['error']['message'] ??
            'Something went wrong: try later';

        throw Exception(errMessage);
      }
      throw Exception('Something went wrong');
    }
  }

  static List<BookModel> parseData(Response<dynamic> response) {
    List<BookModel> books = [];
    var items = response.data['items'];
    for (var bookMap in items) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
