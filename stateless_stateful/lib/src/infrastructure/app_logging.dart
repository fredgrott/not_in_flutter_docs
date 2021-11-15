// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:stateless_stateful/src/infrastructure/app_vars.dart';
import 'package:stateless_stateful/src/infrastructure/build_modes.dart';


// App loggers are never tested so it's okay to have them as
// part of a pure initialize a logger function

final appLogger = Logger(myAppTitle);

/// initLogger called in Main function to initialize appLogger
/// @author Fredrick Allan Grott
void initLogger() {
  if(isInDebugMode) {
    // in debug mode we want all logging levels emitted
    recordStackTraceAtLevel = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (record.error != null && record.stackTrace != null) {
        log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}: ${record.error}: ${record.stackTrace}');

        log(
            // ignore: prefer-trailing-comma
            'level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error} exception: ${record.stackTrace}');
      } else if (record.error != null) {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message} error: ${record.error}');
      } else {
        log('level: ${record.level.name} loggerName: ${record.loggerName} time: ${record.time} message: ${record.message}');
      }
    });
    MyDevLogAppender(formatter: const MyDevLogRecordFormatter())
        .attachToLogger(Logger.root);
  }
  if (isInReleaseMode) {
    recordStackTraceAtLevel = Level.OFF;
    appLogger.level = Level.OFF;
  }
}


LogRecordFormatter defaultLogRecordFormatter() =>
    const DefaultLogRecordFormatter();

LogRecordFormatter defaultReleaseLogRecordFormatter() =>
    const DefaultLogRecordFormatter();

// Formatters

class MyDevLogRecordFormatter extends LogRecordFormatter {
  const MyDevLogRecordFormatter();
  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write('${rec.time} ${rec.level.name} ${rec.zone} '
        '${rec.loggerName} - ${rec.message}');

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        // ignore: cast_nullable_to_non_nullable
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }

    return sb;
  }
}

class MyReleaseLogRecordFormatter extends LogRecordFormatter {
  const MyReleaseLogRecordFormatter();
  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    sb.write('${rec.time} ${rec.level.name}  '
        '${rec.loggerName} - ${rec.message}');

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        // ignore: cast_nullable_to_non_nullable
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }

    return sb;
  }
}

// Appenders

class MyDevLogAppender extends BaseLogAppender {
  MyDevLogAppender({LogRecordFormatter? formatter})
      : super(formatter ?? defaultLogRecordFormatter());

  MyDevLogAppender setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return defaultLogAppender(stderrLevel: stderrLevel)
      ..attachToLogger(Logger.root);
  }

  void Function(Object line)? printer;

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

MyDevLogAppender defaultLogAppender({
  LogRecordFormatter? formatter,
  Level? stderrLevel,
}) =>
    MyDevLogAppender(formatter: formatter);

class MyReleaseLogAppender extends BaseLogAppender {
  MyReleaseLogAppender({LogRecordFormatter? formatter})
      : super(formatter ?? defaultReleaseLogRecordFormatter());

  MyReleaseLogAppender setupLogging({
    Level level = Level.ALL,
    Level stderrLevel = Level.OFF,
  }) {
    Logger.root.clearListeners();
    Logger.root.level = level;
    // ignore: newline-before-return
    return defaultReleaseLogAppender(stderrLevel: stderrLevel)
      ..attachToLogger(Logger.root);
  }

  void Function(Object line)? printer;

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

MyReleaseLogAppender defaultReleaseLogAppender({
  LogRecordFormatter? formatter,
  Level? stderrLevel,
}) =>
    MyReleaseLogAppender(formatter: formatter);
