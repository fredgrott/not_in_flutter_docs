// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_four/src/domain/entities/sample_item.dart';



void main() {
  

  // ignore: no-empty-block
  setUpAll(() async {
    
  });

  group('Sample Item', () {
    test('Sample Item', () {
      const sampleItem = SampleItem(1);

      expect(sampleItem.id, 1);
    });
  });
}
