import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTest extends StatelessWidget {
  const PageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Go to will'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () => GoRouter.of(context).push('/will-pop'),
              child: const Text('Push')),
        ),
      ),
    );
  }
}
