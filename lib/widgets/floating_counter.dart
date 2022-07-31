import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/local_storage.dart';

class FloatingCounter extends StatelessWidget {
  const FloatingCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton(
        backgroundColor: Colors.yellow.shade100,
        onPressed: () {},
        child: Consumer(
          builder: (context, ref, child) {
            ref.read(localStorageProvider.notifier).getData();
            int data = ref.watch(localStorageProvider.notifier).value;
            String count = data.toString();
            return Text(
              count,
              style: readCounterTextStyle,
            );
          },
        ),
      ),
    );
  }
}
