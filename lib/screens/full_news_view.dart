import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/providers/provider.dart';

class FullView extends ConsumerWidget {
  final int index;
  const FullView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(newsProvider).maybeWhen(
          data: (data) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(
                  color: Colors.orange,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data[index].author,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Hero(
                        tag: data[index].title,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(data[index].urlToImage),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(data[index].content),
                    ],
                  ),
                ),
              ),
            );
          },
          orElse: () => const CircularProgressIndicator(),
        );
  }
}
