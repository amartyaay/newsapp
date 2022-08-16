import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/services/auth/auth_providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await auth
                .googleSignIn(context)
                .whenComplete(() => auth.authStateChange.listen((event) {
                      return;
                    }));
          },
          child: const Text('Login With Google'),
        ),
      ),
    );
  }
}
