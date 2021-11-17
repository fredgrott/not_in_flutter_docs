// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';


// Gist: Error Hanlding is dynamic as we need to start with large amounts of
//       untrusted functions and futures and move both to the set of trusted and
//       monitoried functions and futures. We do that by implementing a error
//       handliing infrastructure.
//
//       For usage in data classes that abstract data layers see:
//        https://gist.github.com/CassiusPacheco/409e66e220ce563440df00385f39ac98

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType Exception';
}
