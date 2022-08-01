import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/local_storage.dart';

import 'package:newsapp/services/new_api.dart';

import '../helper/article.dart';

final newsProvider = FutureProvider<List<Article>>((ref) async {
  return await ref.read(apiProvider).apiCall();
});

final localStorageDataProvider = FutureProvider(((ref) async {
  return await ref.watch(localStorageProvider.notifier).getData();
}));
