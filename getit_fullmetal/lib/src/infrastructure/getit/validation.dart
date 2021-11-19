// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_positional_boolean_parameters, use_setters_to_change_properties

import 'defensive.dart';
import 'extensions.dart';

class ValidationErrors {
  final _errors = <String, Object?>{};

  T? getError<T>(String propertyName) {
    if (propertyName.isEmptyOrWhiteSpace) return null;
    propertyName = propertyName.trim();

    if (!propertyName.contains(".")) {
      if (_errors.containsKey(propertyName)) {
        return _errors[propertyName] as T?;
      }

      return null;
    }

    final split = propertyName.split(".");
    dynamic current = _errors;

    for (var i = 0; i < split.length; i++) {
      if (current == null) return null;
      if (current is Map<String, dynamic>) {
        if (!current.containsKey(split[i])) return null;
        current = current[split[i]];
        continue;
      }
      if (current is ValidationErrors) {
        return current.getError(split.sublist(i).join("."));
      }

      // if the top level validation fails then error blow is thrown.
      // validate the top level first before validating a second level error.

      throw Exception(
          "In Map $this the value for key = ${split.getRange(0, i,).join(".")} expected Map<String, dynamic> or ValidationErrors got ${current.runtimeType} [$current]",);
    }

    return current as T?;
  }

  void _setError(String propertyName, Object? value,) {
    _errors.setValue(propertyName, value,);
  }

  @override
  String toString() {
    return _errors.toString();
  }
}

// class ExternalValidator<T extends Object> extends Validator<T> {}

class Validator<T extends Object?> {
  final List<_InternalPropertyValidator<T, Object?>> _propertyValidators = [];
  final _errors = ValidationErrors();
  var _hasErrors = false;
  var _isEnabled = true;

  bool get isValid => !_hasErrors;
  bool get hasErrors => _hasErrors;
  ValidationErrors get errors => _errors;
  bool get hasRules => _propertyValidators.isNotEmpty;
  bool get isEnabled => _isEnabled;

  Validator({bool disabled = false}) {
    _isEnabled = !disabled;
  }

  PropertyValidator<T, TProperty> prop<TProperty extends Object?>(
      String propertyName, TProperty Function(T value) propertyFunc,) {
    given(propertyName, "propertyName",).ensure((t) => t.isNotEmptyOrWhiteSpace);

    final propertyValidator = new _InternalPropertyValidator<T, TProperty>(
        propertyName, propertyFunc,);
    _propertyValidators.add(propertyValidator);
    _errors._setError(propertyName, null,);
    return propertyValidator;
  }

  void clearProp(String propertyName) {
    given(propertyName, "propertyName",).ensure((t) => t.isNotEmptyOrWhiteSpace);
    final _InternalPropertyValidator<T, Object?>? propertyValidator =
        _propertyValidators.find((t) => t.propertyName == propertyName);
    if (propertyValidator == null) return;

    _propertyValidators.remove(propertyValidator);
    _errors._setError(propertyName, null,);
  }

  void validate(T value) {
    _hasErrors = false;
    if (_isEnabled) {
      for (final t in _propertyValidators) {
        t.validate(value);
        if (t.hasError) {
          _hasErrors = true;
          _errors._setError(t.propertyName, t.error,);

          return;
        }

        _errors._setError(t.propertyName, null,);
      }
    } else {
      for (final t in _propertyValidators) {
        _errors._setError(t.propertyName, null,);
      }
    }
  }

  void enable() {
    _isEnabled = true;
  }

  void disable() {
    _isEnabled = false;
  }
}

// public
abstract class PropertyValidator<T, TProperty> {
  PropertyValidator<T, TProperty> isRequired();
  PropertyValidator<T, TProperty> isOptional();

  PropertyValidator<T, TProperty> ensure(
      bool Function(TProperty t) validationPredicate,);
  PropertyValidator<T, TProperty> useValidationRule(
      ValidationRule<TProperty> validationRule,);
  PropertyValidator<T, TProperty> useValidator(Validator<TProperty> validator);

  PropertyValidator<T, TProperty> ensureT(
      bool Function(T value) validationPredicate,);
  PropertyValidator<T, TProperty> when(
      bool Function(T value) conditionPredicate,);
  PropertyValidator<T, TProperty> withMessage(
      {String? message, String Function()? messageFunc,});
}

// public
abstract class ValidationRule<T> {

  dynamic get error;

  factory ValidationRule(bool Function(T val) validationFunc, String error,) {
    given(error, "error",).ensure((t) => t.isNotEmptyOrWhiteSpace);
    
    return _ConcreteValidationRule(validationFunc, error,);
  }
  
  bool validate(T value);

  // ignore: member-ordering
  
}

class _ConcreteValidationRule<T> implements ValidationRule<T> {
  final dynamic _error;
  final bool Function(T) _validate;

  @override
  dynamic get error => _error;

  _ConcreteValidationRule(bool Function(T) validationFunc, Object error,)
      : _validate = validationFunc,
        _error = error;

  @override
  bool validate(T value) {
    return _validate(value);
  }
}

class _InternalPropertyValidator<T, TProperty>
    implements PropertyValidator<T, TProperty> {
  // name has to be there
  final String _propertyName;

  // property func to retrieve property has to be there
  final TProperty Function(T) _propertyFunc;

  var _hasError = false;

  // why obj? for nested validators?
  dynamic _error;

  // rules applied to this property
  final _validationRules = <_InternalPropertyValidationRule<T, TProperty>?>[];

  // ?
  _InternalPropertyValidationRule<T, TProperty>? _lastValidationRule;

  // for when?
  bool Function(T)? _conditionPredicate;

  var _overrideError = false;

  String? _errorMessage;

  String? Function()? _errorMessageFunc;

  String get propertyName => _propertyName;
  bool get hasError => _hasError;
  dynamic get error => _error;

  _InternalPropertyValidator(
      String propertyName, TProperty Function(T) propertyFunc,)
      : _propertyName = propertyName,
        _propertyFunc = propertyFunc;

  void validate(T value) {
    given(value, "value",).ensure((t) => t != null);

    _hasError = false;
    _error = null;

    if (_conditionPredicate != null && _conditionPredicate!(value)) {
      return;
    }

    final TProperty propertyVal = _propertyFunc(value);

    for (var i = 0; i < _validationRules.length; i++) {
      final _InternalPropertyValidationRule<T, TProperty>? validationRule =
          _validationRules[i];
      bool? validationResult = true;

      try {
        validationResult = validationRule?.validate(value, propertyVal,);
      } catch (e) {
        if (e == "OPTIONAL") break;

        rethrow;
      }

      if (validationResult!) {
        _hasError = true;
        // this._error = this._overrideError ? this._errorMessage : validationRule.error;
        dynamic error = validationRule?.error;
        if (_overrideError && validationRule!.overrideError) {
          error = _errorMessageFunc != null
              ? _errorMessageFunc!()
              : _errorMessage;
        }
        _error = error;
        break;
      }
    }
  }

  @override
  PropertyValidator<T, TProperty> isRequired() {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.ensure((propertyValue) {
      if (propertyValue != null) {
        if (propertyValue is String) {
          return propertyValue.trim().isNotEmpty;
        }

        return true;
      }

      return false;
    });

    _lastValidationRule!.withMessage(message: "Required");
    _validationRules.add(_lastValidationRule);

    return this;
  }

  @override
  PropertyValidator<T, TProperty> isOptional() {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.ensure((propertyValue) {
      if (propertyValue == null) throw "OPTIONAL";

      if (propertyValue is String && propertyValue.trim().isEmpty) {
        throw "OPTIONAL";
      }

      return true;
    });

    _validationRules.add(_lastValidationRule);

    return this;
  }

  @override
  PropertyValidator<T, TProperty> ensure(
      bool Function(TProperty) propertyValidationPredicate,) {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.ensure(propertyValidationPredicate);
    _validationRules.add(_lastValidationRule);

    return this;
  }

  @override
  PropertyValidator<T, TProperty> ensureT(
      bool Function(T) valueValidationPredicate,) {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.ensureT(valueValidationPredicate);
    _validationRules.add(_lastValidationRule);

    return this;
  }

  @override
  PropertyValidator<T, TProperty> useValidationRule(
      ValidationRule<TProperty> validationRule,) {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.useValidationRule(validationRule);
    _validationRules.add(_lastValidationRule);
    return this;
  }

  @override
  PropertyValidator<T, TProperty> useValidator(Validator<TProperty> validator) {
    _lastValidationRule =
        _InternalPropertyValidationRule<T, TProperty>();
    _lastValidationRule!.useValidator(validator);
    _validationRules.add(_lastValidationRule);
    return this;
  }

  @override
  PropertyValidator<T, TProperty> when(bool Function(T) conditionPredicate) {
    if (_lastValidationRule == null) {
      _conditionPredicate = conditionPredicate;
    } else
      _lastValidationRule!.when(conditionPredicate);

    return this;
  }

  @override
  PropertyValidator<T, TProperty> withMessage(
      {String? message, String Function()? messageFunc,}) {
    if (message == null && messageFunc == null) {
      throw ArgumentError(
          "Either message or messagefunc has to be provided",);
    }
    if (_lastValidationRule == null) {
      _overrideError = true;
      _errorMessage = message;
      _errorMessageFunc = messageFunc;
    } else {
      _lastValidationRule!.withMessage(
          message: message, messageFunc: messageFunc, overrideError: true,);
    }

    return this;
  }
}

class _InternalPropertyValidationRule<T, TProperty> {
  bool Function(TProperty)? _tPropertyValidationPredicate;
  bool Function(T)? _tValidationPredicate;
  ValidationRule<TProperty>? _validationRule;
  Validator<TProperty>? _validator;
  bool Function(T)? _conditionPredicate;
  String? _errorMessage;
  String Function()? _errorFunc;
  var _overrideError = false;

  dynamic get error {
    if (_validationRule != null && !_overrideError) {
      return _validationRule?.error;
    } else if (_validator != null && !_overrideError) {
      return _validator?.errors;
    } else {
      return _errorFunc != null ? _errorFunc!() : _errorMessage;
    }
  }

  bool get overrideError => _overrideError;

  void ensure(bool Function(TProperty) tPropertyValidationPredicate) {
    _tPropertyValidationPredicate = tPropertyValidationPredicate;
    _errorMessage = "Invalid value";
  }

  void ensureT(bool Function(T) tValidationPredicate) {
    _tValidationPredicate = tValidationPredicate;
    _errorMessage = "Invalid value";
  }

  void useValidationRule(ValidationRule<TProperty> validationRule) {
    _validationRule = validationRule;
  }

 
  void useValidator(Validator<TProperty> validator) {
    _validator = validator;
  }

  
  void when(bool Function(T) conditionPredicate) {
    _conditionPredicate = conditionPredicate;
  }

  void withMessage(
      {String? message,
      String Function()? messageFunc,
      bool overrideError = false,}) {
    _errorMessage = message;
    _errorFunc = messageFunc;
    _overrideError = overrideError;
  }

  bool? validate(T value, TProperty propertyValue,) {
    if (_conditionPredicate != null && !_conditionPredicate!(value)) {
      return true;
    }

    if (_tPropertyValidationPredicate != null)
      return _tPropertyValidationPredicate!(propertyValue);

    if (_tValidationPredicate != null) {
      return _tValidationPredicate!(value);
    }

    if (_validationRule != null) {
      return _validationRule?.validate(propertyValue);
    }

    if (_validator != null) {
      _validator?.validate(propertyValue);

      return _validator?.isValid;
    }

    throw Exception("Validate");
  }
}

// public
abstract class BaseValidationRule<T> implements ValidationRule<T> {
  final _validationRules = <ValidationRule<T>>[];
  dynamic _error;

  @override
  dynamic get error => _error;

  @override
  bool validate(T value) {
    _error = null;
    for (var i = 0; i < _validationRules.length; i++) {
      if (_validationRules[i].validate(value)) continue;
      _error = _validationRules[i].error;

      return false;
    }

    return true;
  }

  void addValidationRule(ValidationRule<T> validationRule) {
    _validationRules.add(validationRule);
  }
}

// public
abstract class BaseNumberValidationRule<T extends num?>
    extends BaseValidationRule<T> {}

class _NumberHasMinValue<T extends num?> extends BaseNumberValidationRule<T> {
  _NumberHasMinValue(num minValue) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t >= minValue,
        "Value cannot be less than $minValue",),);
  }
}

class _NumberHasMaxValue<T extends num?> extends BaseNumberValidationRule<T> {
  _NumberHasMaxValue(num maxValue) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t <= maxValue,
        "Value cannot be greater than $maxValue",),);
  }
}

class _NumberHasExactValue<T extends num?> extends BaseNumberValidationRule<T> {
  _NumberHasExactValue(num exactValue) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t == exactValue, "Value has to be $exactValue",),);
  }
}

class _NumberIsIn<T extends num?> extends BaseNumberValidationRule<T> {
  _NumberIsIn(List<num> values) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || values.contains(t), "Invalid value",),);
  }
}

class _NumberIsNotIn<T extends num?> extends BaseNumberValidationRule<T> {
  _NumberIsNotIn(List<num> values) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || values.every((u) => u != t), "Invalid value",),);
  }
}

// public
abstract class BaseStringValidationRule<T extends String?>
    extends BaseValidationRule<T> {
  bool isNumber(String value) {
    value = value.trim();
    if (value.isEmpty) return false;
    final parsed = num.tryParse(value);

    return parsed != null;
  }
}

class _StringHasMinLength<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringHasMinLength(num minLength) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t.trim().length >= minLength,
        "Min length of $minLength required",),);
  }
}

class _StringHasMaxLength<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringHasMaxLength(num maxLength) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t.trim().length <= maxLength,
        "Max length of $maxLength required",),);
  }
}

class _StringHasExactLength<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringHasExactLength(num exactLength) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || t.trim().length == exactLength,
        "Exact length of $exactLength required",),);
  }
}

class _StringIsIn<T extends String?> extends BaseStringValidationRule<T> {
  _StringIsIn(List<String> values, [bool ignoreCase = false,]) {
    addValidationRule(_ConcreteValidationRule(
        (t) =>
            t == null ||
            (ignoreCase
                ? values.any(
                    (v) => v.trim().toLowerCase() == t.trim().toLowerCase(),)
                : values.any((v) => v.trim() == t.trim())),
        "Invalid value",),);
  }
}

class _StringIsNotIn<T extends String?> extends BaseStringValidationRule<T> {
  _StringIsNotIn(List<String> values, [bool ignoreCase = false,]) {
    addValidationRule(_ConcreteValidationRule(
        (t) =>
            t == null ||
            (ignoreCase
                ? values.every(
                    (v) => v.trim().toLowerCase() != t.trim().toLowerCase(),)
                : values.every((v) => v.trim() != t.trim())),
        "Invalid value",),);
  }
}

class _StringContainsOnlyNumbers<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringContainsOnlyNumbers() {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || isNumber(t), "Invalid value",),);
  }
}

class _StringIsPhoneNumber<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringIsPhoneNumber() {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || (isNumber(t) && t.trim().length == 10),
        "Invalid value",),);
  }
}

class _StringIsEmail<T extends String?> extends BaseStringValidationRule<T> {
  _StringIsEmail() {
    addValidationRule(_ConcreteValidationRule((t) {
      final re = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',);

      return t == null || re.hasMatch(t.trim());
    }, "Invalid value",),);
  }
}

class _StringMatchesRegex<T extends String?>
    extends BaseStringValidationRule<T> {
  _StringMatchesRegex(RegExp regex) {
    addValidationRule(_ConcreteValidationRule(
        (t) => t == null || regex.hasMatch(t), "Invalid format",),);
  }
}

// public
extension NumberPropertyValidatorExt<T, TProperty extends num?>
    on PropertyValidator<T, TProperty> {
  PropertyValidator<T, TProperty> hasMinValue(num minValue) {
    return useValidationRule(_NumberHasMinValue<TProperty>(minValue));
  }

  PropertyValidator<T, TProperty> hasMaxValue(num maxValue) {
    return useValidationRule(_NumberHasMaxValue<TProperty>(maxValue));
  }

  PropertyValidator<T, TProperty> hasExactValue(num exactValue) {
    return useValidationRule(_NumberHasExactValue<TProperty>(exactValue));
  }

  PropertyValidator<T, TProperty> isInNumbers(List<num> values) {
    return useValidationRule(_NumberIsIn<TProperty>(values));
  }

  PropertyValidator<T, TProperty> isNotInNumbers(List<num> values) {
    return useValidationRule(_NumberIsNotIn<TProperty>(values));
  }
}

// public
extension StringPropertyValidatorExt<T, TProperty extends String?>
    on PropertyValidator<T, TProperty> {
  PropertyValidator<T, TProperty> hasMinLength(int minLength) {
    return useValidationRule(_StringHasMinLength<TProperty>(minLength));
  }

  PropertyValidator<T, TProperty> hasMaxLength(int maxLength) {
    return useValidationRule(_StringHasMaxLength<TProperty>(maxLength));
  }

  PropertyValidator<T, TProperty> hasExactLength(int exactLength) {
    return useValidationRule(_StringHasExactLength<TProperty>(exactLength));
  }

  PropertyValidator<T, TProperty> isInStrings(List<String> values,
      [bool ignoreCase = false,]) {
    return useValidationRule(_StringIsIn<TProperty>(values, ignoreCase,));
  }

  PropertyValidator<T, TProperty> isNotInStrings(List<String> values,
     
      [bool ignoreCase = false,]) {
    return useValidationRule(_StringIsNotIn<TProperty>(values, ignoreCase,));
  }

  PropertyValidator<T, TProperty> containsOnlyNumbers() {
    return useValidationRule(_StringContainsOnlyNumbers<TProperty>());
  }

  PropertyValidator<T, TProperty> isPhoneNumber() {
    return useValidationRule(_StringIsPhoneNumber<TProperty>());
  }

  PropertyValidator<T, TProperty> isEmail() {
    return useValidationRule(_StringIsEmail<TProperty>());
  }

  PropertyValidator<T, TProperty> matchesRegex(RegExp regex) {
    return useValidationRule(_StringMatchesRegex<TProperty>(regex));
  }
}
