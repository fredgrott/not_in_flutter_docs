// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:gtdd_seven/src/domain/data/entities/sample_item.dart';

class ThemeModel extends Equatable implements SampleItem {
  late final int _id;

  @override
  int get id => _id;

  @override
  List<Object?> get props => [_id];

  set id(int _id) {
    SampleItem(_id);
  }
}
