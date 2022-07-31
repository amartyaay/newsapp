import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/provider.dart';

class FullView extends StatelessWidget {
  final int index;
  // const FullView({});
  const FullView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ref.watch(newsProvider).when(
              data: ((data) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(
                          data[index].urlToImage,
                        ),
                        errorBuilder: ((context, error, stackTrace) {
                          return Image.network(
                            imgUrl,
                            height: 200,
                            width: double.infinity,
                          );
                        }),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data[index].title,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 160, 217, 245),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index].author,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            data[index].publishedAt.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            data[index].description,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              error: ((error, stackTrace) => Text(error.toString())),
              loading: (() => const CircularProgressIndicator()));
        },
      ),
    );
  }
}
