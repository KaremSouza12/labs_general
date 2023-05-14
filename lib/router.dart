import 'package:bottom_sheet_poc/home.dart';
import 'package:bottom_sheet_poc/page_test.dart';
import 'package:bottom_sheet_poc/will_pop_example.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(
        title: 'BottomSheet',
      ),
    ),
    GoRoute(
      path: '/will-pop',
      builder: (context, state) => const WillPopScopeExample(),
    ),
    GoRoute(
      path: '/go-to-will-pop',
      builder: (context, state) => const PageTest(),
    ),
  ],
);
