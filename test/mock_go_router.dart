import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MockGoRouter {
  static MockGoRouter of(BuildContext context) {
    final router = Router.of(context);
    if (router is GoRouter) {
      return MockGoRouter._(router as GoRouter);
    } else {
      throw Exception('No GoRouter found in context');
    }
  }

  final GoRouter _router;

  MockGoRouter._(this._router);

  void pop({dynamic result}) {
    _router.pop(result);
  }

  Future<T?> navigate<T extends Object?>(String path, {Object? parameters}) {
    return _router.pushNamed<T>(path, extra: parameters);
  }
}
