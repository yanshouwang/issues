import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('#1 Can catch future error', () async {
    final completer = Completer();
    final future = completer.future;
    final caller = (data) {
      final error = Exception('ABC');
      completer.completeError(error);
    };
    caller('data');
    try {
      await future;
    } catch (e) {
      expect('$e', 'Exception: ABC');
    }
  });

  test('#2 Can catch future error', () async {
    final completer = Completer();
    final future = completer.future;
    final caller = (data) {
      final error = Exception('ABC');
      completer.completeError(error);
    };
    caller('data');
    final duration = Duration(milliseconds: 500);
    await Future.delayed(duration);
    try {
      await future;
    } catch (e) {
      expect('$e', 'Exception: ABC');
    }
  });
}
