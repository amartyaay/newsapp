import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/screens/full_news_view.dart';
import 'package:newsapp/services/local_storage.dart';

class CardView extends ConsumerWidget {
  final String title, img;
  final int index;
  const CardView(
      {super.key, required this.img, required this.title, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = ref.watch(localStorageProvider);
    return GestureDetector(
      onTap: () {
        ref.read(localStorageProvider.notifier).increase();
        ref.read(localStorageProvider.notifier).saveData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => FullView(index: index))),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Image(
                image: NetworkImage(img),
                errorBuilder: ((context, error, stackTrace) {
                  return Image.network(
                    imgUrl,
                    height: 100,
                    width: 100,
                  );
                }),
                height: 100,
                width: 100,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
