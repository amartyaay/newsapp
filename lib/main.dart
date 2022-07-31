import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/screens/home_view.dart';
import 'package:newsapp/services/local_storage.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Home(),
      ),
    ),
  );
}
