// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

// In clean arch entities and models are the same
class SampleItemModel extends Equatable {
  final int sampleItemId;

  int get id => sampleItemId;


  @override
  List<Object?> get props => [sampleItemId];

  

  set id(int _id) {
    id = _id;
  }

  

  


  const SampleItemModel({
    required this.sampleItemId,
  });

  

  
}
