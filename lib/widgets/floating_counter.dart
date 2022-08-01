import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/local_storage.dart';
import 'package:newsapp/services/provider.dart';

class FloatingCounter1 extends StatelessWidget {
  const FloatingCounter1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Consumer(
        builder: (context, ref, child) {
          return ref.watch(localStorageDataProvider).maybeWhen(
                data: (data) {
                  return Text(
                    ref.read(localStorageProvider.notifier).value.toString(),
                    style: readCounterTextStyle,
                  );
                },
                orElse: () => const Text(
                  'L',
                  style: readCounterTextStyle,
                ),
              );
        },
      ),
    );
  }
}

class FloatingCounter extends StatelessWidget {
  const FloatingCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Consumer(
        builder: (context, ref, child) {
          ref.read(localStorageProvider.notifier).getData();
          String count =
              ref.read(localStorageProvider.notifier).value.toString();
          return Text(
            count,
            style: readCounterTextStyle,
          );
        },
      ),
    );
  }
}
