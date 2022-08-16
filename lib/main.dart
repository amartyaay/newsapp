import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/screens/home_view.dart';
import 'package:newsapp/screens/loading_page.dart';
import 'package:newsapp/screens/login_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user == null) {
                return const LoginPage();
              } else {
                return const Home();
              }
            default:
              return const LoadingPage();
          }
        }));
  }
}
