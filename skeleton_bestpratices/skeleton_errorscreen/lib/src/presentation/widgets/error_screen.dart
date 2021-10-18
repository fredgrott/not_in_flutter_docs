// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeleton_errorscreen/src/infrastructure/app_vars.dart';


// This is the FlutterError version
//
// Under Catcher we would have no function 
// parameter and the details exception for 
// description would change to a generic funny and 
// ironic error description
Widget errorScreen(Object detailsException) {
  return MyErrorScreen(

    description: detailsException as String,
    maxWidthForSmallMode: maxWidthForSmallMode,
    showStacktrace: showStackTrace,
    title: errorScreenTitle,
  );
}

class MyErrorScreen extends StatelessWidget {
  final FlutterErrorDetails? details;
  final bool showStacktrace;
  final String title;
  final String description;
  final double maxWidthForSmallMode;

  const MyErrorScreen(
      {Key? key,
      this.details,
      required this.showStacktrace,
      required this.title,
      required this.description,
      required this.maxWidthForSmallMode,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < maxWidthForSmallMode) {
          return _buildSmallErrorWidget();
        } else {
          return _buildNormalErrorWidget();
        }
      },
    );
  }

  Widget _buildSmallErrorWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/something_went_wrong.png",
          fit: BoxFit.cover,
        ),
        const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 40,
          ),
        )
      ],
    );
  }

  Widget _buildNormalErrorWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/something_went_wrong.png",
          fit: BoxFit.cover,
        ),
        Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: ListView(children: [
          _buildIcon(),
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            _getDescription(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          _buildStackTraceWidget()
        ],),
      ),
    )
      ],
    );
  }

  Widget _buildIcon() {
    return const Icon(
      Icons.announcement,
      color: Colors.red,
      size: 40,
    );
  }

  Widget _buildStackTraceWidget() {
    if (showStacktrace) {
      final List<String> items = [];
      if (details != null) {
        items.add(details!.exception.toString());
        items.addAll(details!.stack.toString().split("\n"));
      }
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final String line = items[index];
          if (line.isNotEmpty == true) {
            return Text(line);
          } else {
            return const SizedBox();
          }
        },
      );
    } else {
      return const SizedBox();
    }
  }

  String _getDescription() {
    String descriptionText = description;
    if (showStacktrace) {
      descriptionText += " See details below.";
    }
    return descriptionText;
  }
}
