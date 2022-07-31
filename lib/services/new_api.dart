import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/helper/article.dart';

final apiProvider = Provider((ref) => GetNews());
final newsProvider = FutureProvider<List<Article>>((ref) async {
  return ref.read(apiProvider).apiCall();
});

class GetNews {
  final String apiKey = dotenv.get('new_api_key', fallback: 'not_found');
  late String apiURL;
  GetNews() {
    apiURL =
        "https://newsdata.io/api/1/news?apikey=$apiKey+&category=science,politics,world,environment,business&language=en&country=us";
  }
  Future<void> checkApi() async {
    await Future.delayed(const Duration(seconds: 1));
    // print(apiURL);
  }

  Future<List<Article>> apiCall() async {
    List<Article> newsCollection = [];
    final res = await http.get(Uri.parse(apiURL));
    final jsonData = jsonDecode(res.body);
    if (jsonData['status'] == 'success') {
      print(jsonData['results']);
    } else
      print('api failed');
    return newsCollection;
  }
}
