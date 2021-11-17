// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

// Gist: Base class for all app exceptions

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType Exception';
}
