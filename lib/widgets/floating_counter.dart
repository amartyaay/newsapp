import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/provider.dart';

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
          return ref.watch(counterController).maybeWhen(
                data: (data) => Text(
                  data.toString(),
                  style: readCounterTextStyle,
                ),
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
