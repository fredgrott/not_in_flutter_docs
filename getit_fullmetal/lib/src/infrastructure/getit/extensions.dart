// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of the Floater pacakge which was
// created by Shrey Mahendru under mIT License



extension MapStringDynamicExt on Map<String, dynamic> {
  T? getValue<T>(String key) {
    if (key.isEmptyOrWhiteSpace) return null;

    key = key.trim();

    if (!key.contains(".")) {
      if (containsKey(key)) return this[key] as T?;

      return null;
    }

    final split = key.split(".");
    dynamic current = this;

    for (var i = 0; i < split.length; i++) {
      if (current == null) return null;
      if (current is Map<String, dynamic>) {
        if (!current.containsKey(split[i])) return null;
        current = current[split[i]];
        continue;
      }

      throw Exception(
          "In Map $this the value for key = ${split.getRange(0, i).join(".")} expected Map<String, dynamic> got ${current.runtimeType} [$current]",);
    }

    return current as T?;
  }

  void setValue(String key, dynamic value,) {
    if (key.isEmptyOrWhiteSpace) return;

    key = key.trim();

    if (!key.contains(".")) {
      this[key] = value;

      return;
    }

    final split = key.split(".");
    dynamic current = this;

    for (var i = 0; i < split.length - 1; i++) {
      dynamic next = current[split[i]];
      next ??= <String, dynamic>{};
      if (next is! Map<String, dynamic>) {
        throw Exception(
            "In Map $this the value for key = ${split.getRange(0, i + 1).join(".")} expected Map<String, dynamic> got ${next.runtimeType} [$next]",);
      }
      current[split[i]] = next;
      current = next;
    }

    current[split.last] = value;
  }
}

typedef Predicate<T> = bool Function(T t);
typedef ValueFunction<T, TKey> = TKey Function(T t);

extension ListExt<T> on List<T> {
  T? find(Predicate<T> predicate) {
    for (final element in this) {
      if (predicate(element)) return element;
    }

    return null;
  }

  List<T> orderBy<TKey extends Comparable<dynamic>>(ValueFunction<T, TKey> valueFunc) {
    // given(valueFunc, "valueFunc").ensureHasValue();
    final internal = toList();

    internal.sort((a, b,) {
      final valA = valueFunc(a);
      final valB = valueFunc(b);

      return valA.compareTo(valB);
    });

    return internal;
  }

  List<T> orderByDesc<TKey extends Comparable<dynamic>>(
      ValueFunction<T, TKey> valueFunc,) {
    // given(valueFunc, "valueFunc").ensureHasValue();
    final internal = toList();

    internal.sort((a, b,) {
      final valA = valueFunc(a);
      final valB = valueFunc(b);

      return valB.compareTo(valA);
    });

    return internal;
  }
}

// extension ListExtComparable<T> on List<Comparable<T>> {
//   List<T> orderBy() {
//     final internal = this.toList();
//     internal.sort((a, b) {
//       return a.compareTo(b as T);
//     });
//     return internal as List<T>;
//   }

//   List<T> orderByDesc() {
//     final internal = this.toList();
//     internal.sort((a, b) {
//       return b.compareTo(a as T);
//     });
//     return internal as List<T>;
//   }
// }

extension ListStringExt on List<String> {
  List<String> orderBy() {
    final internal = toList();
    internal.sort((a, b,) {
      return a.compareTo(b);
    });

    return internal;
  }

  List<String> orderByDesc() {
    final internal = toList();
    internal.sort((a, b,) {
      return b.compareTo(a);
    });

    return internal;
  }
}

extension ListNumExt on List<num> {
  List<num> orderBy() {
    final internal = toList();
    internal.sort((a, b,) {
      return a.compareTo(b);
    });

    return internal;
  }

  List<num> orderByDesc() {
    final internal = toList();
    internal.sort((a, b,) {
      return b.compareTo(a);
    });

    return internal;
  }
}

extension ListIntExt on List<int> {
  List<int> orderBy() {
    final internal = toList();
    internal.sort((a, b,) {
      return a.compareTo(b);
    });

    return internal;
  }

  List<int> orderByDesc() {
    final internal = toList();
    internal.sort((a, b,) {
      return b.compareTo(a);
    });

    return internal;
  }
}

extension ListDoubleExt on List<double> {
  List<double> orderBy() {
    final internal = toList();
    internal.sort((a, b,) {
      return a.compareTo(b);
    });

    return internal;
  }

  List<double> orderByDesc() {
    final internal = toList();
    internal.sort((a, b,) {
      return b.compareTo(a);
    });

    return internal;
  }
}

extension StringExt on String {
  bool get isEmptyOrWhiteSpace {

    return trim().isEmpty;
  }

  bool get isNotEmptyOrWhiteSpace {

    return !isEmptyOrWhiteSpace;
  }
}
