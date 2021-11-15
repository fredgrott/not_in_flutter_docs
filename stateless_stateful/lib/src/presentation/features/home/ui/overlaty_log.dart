// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class LogEntry extends StatefulWidget {
  static OverlayEntry? _logEntry;
  LogEntry() : super(key: entryKey);

  @override
  LogEntryState createState() {
    return LogEntryState();
  }

  

  static void init(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final OverlayState? overlayState = Overlay.of(context);
      if (overlayState == null) return;
      _logEntry?.remove();
      _logEntry = OverlayEntry(builder: (context) {
        return LogEntry();
      },);
      // ignore: cast_nullable_to_non_nullable
      overlayState.insert(_logEntry as OverlayEntry);
    });
  }
}

class LogEntryState extends State<LogEntry> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void add(String log) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (mounted) {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 2 / 3),
      color: Colors.black54,
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: _logs.length,
              itemBuilder: (context, index,) {
                final String log = _logs[index];

                return Text(
                  log,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                );
              },
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                iconSize: 16,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _logs.clear();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final GlobalKey<LogEntryState> entryKey = GlobalKey();
final List<String> _logs = [];

class LogManager {
  void add(String log) {
    _logs.add(log);
    // print(log);
    entryKey.currentState?.add(log);
  }
}

final LogManager lifecycleLog = LogManager();
