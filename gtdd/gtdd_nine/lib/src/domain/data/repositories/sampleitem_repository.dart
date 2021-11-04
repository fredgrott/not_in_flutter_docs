// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dartz/dartz.dart';
import 'package:gtdd_nine/src/domain/data/models/sample_item_model.dart';
import 'package:gtdd_nine/src/infrastructure/exceptions/failure.dart';

abstract class SampleItemRepository {
  Future<Either<Failure, SampleItemModel>> getSampleItem(int ourItem);
}
