import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/new_api.dart';
import 'package:newsapp/services/provider.dart';
import 'package:newsapp/widgets/card_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          return ref.watch(newsProvider).when(
              data: ((data) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: ListView.builder(
                    itemCount: data.length,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return CardView(
                        index: index,
                        img: data[index].urlToImage,
                        title: data[index].title,
                      );
                    }),
                  ),
                );
              }),
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: (() =>
                  const Center(child: CircularProgressIndicator())));
        }),
      ),
    );
  }
}
