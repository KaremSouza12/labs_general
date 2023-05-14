import 'package:bottom_sheet_poc/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  late GoRouter goRouter;

  setUp(
    () => goRouter = MockGoRouter(),
  );

  testWidgets('Teste do BottomSheet personalizado',
      (WidgetTester tester) async {
    final bottomSheet = BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const Text('Conteúdo do BottomSheet'),
              ElevatedButton(
                onPressed: () {
                  goRouter.pop();
                },
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: bottomSheet,
        ),
      ),
    );

    final textFinder = find.text('Conteúdo do BottomSheet');
    expect(textFinder, findsOneWidget);

    // toque no botão que abre o BottomSheet
    // await tester.tap(find.byType(FloatingActionButton));
    // await tester.pumpAndSettle();

    // toque no botão "Fechar"
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    verify(goRouter.pop()).called(1);
  });
}
