// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:getit_fullmetal/src/infrastructure/getit/defensive.dart';
import 'package:getit_fullmetal/src/infrastructure/getit/event_propagator.dart';
import 'package:getit_fullmetal/src/infrastructure/getit/secure_storage.dart';

import 'package:meta/meta.dart';

abstract class ServiceRegistry {
  void registerInstance<T extends Object>(T value);
  void registerSingleton<T extends Object>(T Function() factoryFunc);
  void registerTransient<T extends Object>(T Function() factoryFunc);
  void registerScoped<T extends Object>(T Function() factoryFunc);
}

abstract class _Registration<T extends Object> {
  final Type type = T;

  void register(GetIt getIt);
}

class _InstanceRegistration<T extends Object> extends _Registration<T> {
  final T value;

  _InstanceRegistration(this.value);

  @override
  void register(GetIt getIt) {
    // given(getIt, "getIt").ensureHasValue();
    getIt.registerSingleton<T>(value);
  }
}

class _SingletonRegistration<T extends Object> extends _Registration<T> {
  final T Function() factoryFunc;

  _SingletonRegistration(this.factoryFunc);

  @override
  void register(GetIt getIt) {
    // given(getIt, "getIt").ensureHasValue();
    getIt.registerLazySingleton<T>(factoryFunc);
  }
}

class _TransientRegistration<T extends Object> extends _Registration<T> {
  final T Function() factoryFunc;

  _TransientRegistration(this.factoryFunc);

  @override
  void register(GetIt getIt) {
    // given(getIt, "getIt").ensureHasValue();
    getIt.registerFactory<T>(factoryFunc);
  }
}

class _ScopedRegistration<T extends Object> extends _Registration<T> {
  final T Function() factoryFunc;

  _ScopedRegistration(this.factoryFunc);

  @override
  void register(GetIt getIt) {
    // given(getIt, "getIt").ensureHasValue();
    getIt.registerLazySingleton<T>(factoryFunc);
  }
}

class _Container implements ServiceRegistry {
  final instanceRegistrations = <_InstanceRegistration>[];
  final singletonRegistrations = <_SingletonRegistration>[];
  final transientRegistrations = <_TransientRegistration>[];
  final scopedRegistrations = <_ScopedRegistration>[];
  final _types = <Type>[];
  final GetIt _getIt = GetIt.instance;
  bool _isBootstrapped = false;

  @override
  void registerInstance<T extends Object>(T value) {
    // given(value, "value").ensureHasValue();
    given(
      this,
      "this",
    )
        .ensure(
          (t) => !t._types.contains(T),
          "Type $T is already registered",
        )
        .ensure(
          (t) => !t._isBootstrapped,
          "Already bootstrapped",
        );
    instanceRegistrations.add(_InstanceRegistration<T>(value));
    _types.add(T);
    log('Type $T registered');
  }

  @override
  void registerSingleton<T extends Object>(T Function() factoryFunc) {
    // given(factoryFunc, "factoryFunc").ensureHasValue();
    given(
      this,
      "this",
    )
        .ensure(
          (t) => !t._types.contains(T),
          "Type $T is already registered",
        )
        .ensure(
          (t) => !t._isBootstrapped,
          "Already bootstrapped",
        );
    singletonRegistrations.add(_SingletonRegistration<T>(factoryFunc));
    _types.add(T);
    log('Type $T registered');
  }

  @override
  void registerTransient<T extends Object>(T Function() factoryFunc) {
    // given(factoryFunc, "factoryFunc").ensureHasValue();
    given(
      this,
      "this",
    )
        .ensure(
          (t) => !t._types.contains(T),
          "Type $T is already registered",
        )
        .ensure(
          (t) => !t._isBootstrapped,
          "Already bootstrapped",
        );
    transientRegistrations.add(_TransientRegistration<T>(factoryFunc));
    _types.add(T);
    log('Type $T registered');
  }

  @override
  void registerScoped<T extends Object>(T Function() factoryFunc) {
    // given(factoryFunc, "factoryFunc").ensureHasValue();
    given(
      this,
      "this",
    )
        .ensure(
          (t) => !t._types.contains(T),
          "Type $T is already registered",
        )
        .ensure(
          (t) => !t._isBootstrapped,
          "Already bootstrapped",
        );
    scopedRegistrations.add(_ScopedRegistration<T>(factoryFunc));
    _types.add(T);
    log('Type $T registered');
  }

  void bootstrap() {
    given(
      this,
      "this",
    ).ensure(
      (t) => !t._isBootstrapped,
      "Already bootstrapped",
    );

    if (!_types.contains(EventAggregator)) {
      registerSingleton<EventAggregator>(() => FloaterEventAggregator());
      log('EventAggregator registered');
    }

    if (!_types.contains(SecureStorageService)) {
      registerSingleton<SecureStorageService>(
        () => FloaterSecureStorageService(),
        
      );
      log('SecureStorage registered');
    }

    for (final element in instanceRegistrations) {
      element.register(_getIt);
    }
    for (final element in singletonRegistrations) {
      element.register(_getIt);
    }
    for (final element in transientRegistrations) {
      element.register(_getIt);
    }
    // Deliberately not doing scoped registrations

    _isBootstrapped = true;
  }

  _ChildScope createChildScope() {
    given(
      this,
      "this",
    ).ensure(
      (t) => t._isBootstrapped,
      "Not bootstrapped",
    );

    return _ChildScope(this);
  }

  T resolve<T extends Object>() {
    given(
      this,
      "this",
    ).ensure(
      (t) => t._isBootstrapped,
      "Not bootstrapped",
    );

    return _getIt.get();
  }
}

@sealed
class ServiceLocator {
  static final _instance = ServiceLocator._private();

  static ServiceLocator get instance => _instance;

  ServiceLocator._private();

  T? resolve<T extends Object>() {
    return ServiceManager.instance._resolve();
  }
}

abstract class Disposable {
  void dispose();
}

class _ChildScope implements ServiceLocator, Disposable {
  final _Container _parentScope;
  final GetIt _getIt = GetIt.asNewInstance();
  final _instances = <Disposable>[];
  var _isDisposed = false;

  _ChildScope(_Container parentScope) : _parentScope = parentScope {
    for (final element in _parentScope.scopedRegistrations) {
      element.register(_getIt);
    }
  }

  @override
  T resolve<T extends Object>() {
    if (_isDisposed) throw Exception("Object disposed");

    if (_parentScope.scopedRegistrations.any((element) => element.type == T)) {
      final instance = _getIt.get<T>();
      if (instance is Disposable && !_instances.contains(instance)) {
        _instances.add(instance);
      }

      return instance;
    } else {
      return _parentScope.resolve();
    }
  }

  @override
  void dispose() {
    if (_isDisposed) throw Exception("Object disposed");
    _getIt.reset();
    for (final instance in _instances) {
      instance.dispose();
    }
    _isDisposed = true;
  }
}

abstract class ServiceInstaller {
  void install(ServiceRegistry registry);
}

@sealed
class ServiceManager {
  static final _Container _container = _Container();
  static final _instance = ServiceManager._private();
  static var _isBootstrapped = false;

  static ServiceManager get instance => _instance;

  ServiceManager._private();

  void useInstaller(ServiceInstaller installer) {
    // given(installer, "installer").ensureHasValue();

    if (_isBootstrapped) throw StateError("Already bootstrapped");

    installer.install(_container);
  }

  void bootstrap() {
    if (_isBootstrapped) throw StateError("Already bootstrapped");

    _container.bootstrap();
    _isBootstrapped = true;
  }

  ServiceLocator createScope() {
    if (!_isBootstrapped) throw StateError("Not bootstrapped");

    return _container.createChildScope();
  }

  T _resolve<T extends Object>() {
    if (!_isBootstrapped) throw StateError("Not bootstrapped");

    return _container.resolve();
  }

  
}
