import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/screens/home_view.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home(),
      ),
    ),
  );
}


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var newsCollection;
//   bool _loading = true;
//   void getNews() async {
//     News news = News();
//     await news.apiCall();
//     newsCollection = news.newsList;
//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   void initState() {
//     _loading = true;
//     super.initState();
//     getNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_loading == true) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('News App'),
//           centerTitle: true,
//         ),
//         body: const CircularProgressIndicator(),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('News App'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 2),
//         child: ListView.builder(
//           itemCount: newsCollection.length,
//           shrinkWrap: true,
//           physics: const ClampingScrollPhysics(),
//           itemBuilder: ((context, index) {
//             return CardView(
//               img: newsCollection[index].urlToImage,
//               title: newsCollection[index].title,
//               des: newsCollection[index].description,
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
