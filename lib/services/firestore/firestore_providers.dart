import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/firestore/firestore_methods.dart';

final saveListProvider = FutureProvider(
  (ref) async {
    return ref.watch(firestoreprovider).getFav();
  },
);
