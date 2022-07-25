import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/helper/aricle.dart';

class News {
  // const String apiKey = "f90cbe3affcc4a4a9c5b28a258665a89";
  final String url =
      "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=f90cbe3affcc4a4a9c5b28a258665a89";
  List<Article> newsList = [];
  Future<dynamic> apiCall() async {
    final res = await http.get(Uri.parse(url));
    // return res;
    final jsonData = jsonDecode(res.body);
    // print(jsonData['totalResults']);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              // author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              // publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            newsList.add(article);
            // print("added article");
          }
        },
      );
    }
    // print(newsList);
  }
}
