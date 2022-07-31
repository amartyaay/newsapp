import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/new_api.dart';

class FullView extends StatelessWidget {
  final int index;
  // const FullView({});
  const FullView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return ref.watch(newsProvider).when(
              data: ((data) {
                return Column(
                  children: [
                    Image(
                      image: NetworkImage(
                        data[index].urlToImage,
                      ),
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data[index].title,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      data[index].description,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                );
              }),
              error: ((error, stackTrace) => Text(error.toString())),
              loading: (() => const CircularProgressIndicator()));
        },
      ),
    );
  }
}
