// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

/// So we can load and precache asset images used
/// for backgrounds etc as we do not want a full
/// app screen as one huge big stateful widget.
///
/// Takes an asset image path as an imagePath parameter and
/// returns an image with BoxFit.cover applied.
///
/// @author Fredrick Allan Grott
class ImageCacheWidget extends StatefulWidget {
  final String imagePath;

  const ImageCacheWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImageCacheWidget> createState() => ImageCacheWidgetState();
}

class ImageCacheWidgetState extends State<ImageCacheWidget> {
  late Image image1;

  @override
  void initState() {
    super.initState();

    image1 = Image.asset(widget.imagePath);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // generally reference elsewhere in the app as image1.image and image2.image
    precacheImage(image1.image, context);
  }

  @override
  Widget build(BuildContext context) {
    
    return FittedBox(
      fit: BoxFit.cover,
      child: image1,
    );
  }
}
