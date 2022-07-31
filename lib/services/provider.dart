import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:newsapp/services/new_api.dart';

import '../helper/article.dart';

final newsProvider = FutureProvider<List<Article>>((ref) async {
  return ref.read(apiProvider).apiCall();
});
