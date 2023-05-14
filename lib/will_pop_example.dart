import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Flutter code sample for [WillPopScope].

// class WillPopScopeExampleApp extends StatelessWidget {
//   const WillPopScopeExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: WillPopScopeExample(),
//     );
//   }
// }

class WillPopScopeExample extends StatefulWidget {
  const WillPopScopeExample({super.key});

  @override
  State<WillPopScopeExample> createState() => _WillPopScopeExampleState();
}

class _WillPopScopeExampleState extends State<WillPopScopeExample> {
  Future<bool?> showConfirmationDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja Sair??'),
            actions: [
              TextButton(
                onPressed: () => GoRouter.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => GoRouter.of(context).pop(true),
                child: const Text('Sair'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
    return WillPopScope(
      onWillPop: () async {
        if (!shouldPop) {
          final confirmation = await showConfirmationDialog();
          return confirmation ?? false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WillPopScope demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // OutlinedButton(
              //   child: const Text('Push'),
              //   onPressed: () {
              //     GoRouter.of(context).push('/will-pop');
              //   },
              // ),
              OutlinedButton(
                child: Text('shouldPop: $shouldPop'),
                onPressed: () {
                  setState(
                    () {
                      shouldPop = !shouldPop;
                    },
                  );
                },
              ),
              const Text('Push to a new screen, then tap on shouldPop '
                  'button to toggle its value. Press the back '
                  'button in the appBar to check its behavior '
                  'for different values of shouldPop'),
            ],
          ),
        ),
      ),
    );
  }
}
