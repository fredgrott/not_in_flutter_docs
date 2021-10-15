// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
//  Original MIT license Copyright (c) 2020 hientrung
// Modified


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

///Base class used to create view model
abstract class ViewModel extends DiagnosticableTree {
  var _shouldReactive = true;

  ///Called before build in first time and reactive after it dispose
  @mustCallSuper
  void activate() {
    _shouldReactive = false;
  }

  ///Called after view element no longer used
  @mustCallSuper
  void dispose() {
    _shouldReactive = true;
  }

  ///Global cache view models
  static final _cached = <Type, ViewModel>{};

  ///Get created view model
  static T? of<T extends ViewModel>() => _cached[T] as T?;
}

///Widget base on view model
abstract class ViewWidget<T extends ViewModel> extends StatelessWidget {
  ///Create user interface (view) with view model object
  Widget builder(BuildContext context, T model);

  ///Initial view model object
  T initModel();

  ///Create view widget
  const ViewWidget({Key? key}) : super(key: key);

  ///Use view model as a singleton object or not
  bool get cacheModel => true;

  @override
  Widget build(BuildContext context) {
    return builder(context, ViewModel.of<T>()!);
  }

  @override
  StatelessElement createElement() {
    var model = ViewModel.of<T>();
    if (model == null) {
      model = initModel();
      ViewModel._cached[T] = model;
    }

    return _ViewWidgetElement(this, model);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<T>.lazy('model', () => ViewModel.of<T>()));
  }
}

class _ViewWidgetElement extends StatelessElement {
  final ViewModel model;
  _ViewWidgetElement(ViewWidget widget, this.model) : super(widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    if (model._shouldReactive) {
      model.activate();
    }
    super.mount(parent, newSlot);
  }

  @override
  void unmount() {
    model.dispose();
    if (!(widget as ViewWidget).cacheModel) {
      ViewModel._cached.remove(model.runtimeType);
    }
    super.unmount();
  }
}
