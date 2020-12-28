import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('#1 Can catch future error', () async {
    final completer = Completer();
    final future = completer.future;
    final error = Exception('ABC');
    completer.completeError(error);
    expect(future, throwsException);
  });

  test('#2 Can catch future error', () async {
    final completer = Completer();
    final future = completer.future;
    final error = Exception('ABC');
    completer.completeError(error);
    final duration = Duration(milliseconds: 500);
    await Future.delayed(duration);
    expect(future, throwsException);
  });
}
