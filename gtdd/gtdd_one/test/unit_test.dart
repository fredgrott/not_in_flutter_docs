// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_one/src/domain/entities/sample_item.dart';
import 'package:mocktail/mocktail.dart';

class MyID {
  final myID = 1;
}

class MockID extends Mock implements MyID {}

void main() {
  late final int anID;

  setUpAll(() async {
    anID = MockID().myID;
  });

  group('Sample Item', () {
    test('Sample Item', () {
      final sampleItem = SampleItem(anID);

      expect(sampleItem.id, 1);
    });
  });
}
