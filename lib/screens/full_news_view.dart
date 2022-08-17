import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/auth/auth_providers.dart';
import 'package:newsapp/services/firestore/firestore_methods.dart';
import 'package:newsapp/services/firestore/firestore_providers.dart';
import 'package:newsapp/services/providers/provider.dart';
import 'package:newsapp/widgets/snackbar.dart';

class FullView extends ConsumerWidget {
  final int index;
  final bool isFromSaved;
  const FullView({Key? key, required this.index, required this.isFromSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newNewsList = ref.watch(newsProvider);
    final savedNewsList = ref.watch(saveListProvider);
    final AsyncValue refObject;
    if (isFromSaved) {
      refObject = savedNewsList;
    } else {
      refObject = newNewsList;
    }
    return refObject.maybeWhen(
      data: (data) {
        bool isSaved = false;
        final user = ref.read(authProvider).getCurrentUser();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.orange,
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  if (!isSaved) {
                    String email = user?.email ?? '';
                    if (email != '') {
                      try {
                        await FirestoreMethods().addFav(
                          data[index].title,
                          data[index].urlToImage,
                          data[index].content,
                          data[index].author,
                        );
                        showSnackBar(context, 'Saved');
                        isSaved = true;
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                    } else {
                      showSnackBar(context, 'Login To Save Article');
                    }
                  }
                },
                icon: const Icon(Icons.add),
              ),
            ],
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
                      child: Image(
                        image: NetworkImage(data[index].urlToImage),
                        errorBuilder: ((context, error, stackTrace) =>
                            Image.network(imgUrl)),
                      ),
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
