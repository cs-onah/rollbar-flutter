import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rollbar_dart/rollbar.dart';
import 'package:rollbar_flutter/src/hooks/flutter_hook.dart';

void main() async {
  final sut = FlutterHook();

  setUp(() {
    Config config = const Config(
      accessToken: '',
      ignoredExceptions: [Exception1],
    );
    sut.install(config);
  });

  test('isIgnored returns true if object is in IgnoredExceptions', () {
    final result = sut.isIgnored(FlutterErrorDetails(exception: Exception1()));
    expect(result, true);
  });

  test('isIgnored returns false if object is not in IgnoredExceptions', () {
    final result = sut.isIgnored(FlutterErrorDetails(exception: Exception2()));
    expect(result, false);
  });
}

class Exception1 {}

class Exception2 {}
