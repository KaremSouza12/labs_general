import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          const Text('Conteúdo do BottomSheet'),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pop(); // chamada goRouter.pop() para fechar o BottomSheet
            },
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
