// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_six/src/domain/data/entities/sample_item.dart';




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
