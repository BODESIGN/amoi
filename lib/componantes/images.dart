import 'package:amoi/componantes/colors.dart';
import 'package:flutter/material.dart';

// ==================================================================

Image logoAmoi(double size) {
  return Image.asset("assets/logo/logowhite.png", width: size, height: size);
}

// ==================================================================

Widget logoContainer(double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: colorPrimary,
      borderRadius: BorderRadius.circular(size / 2),
    ),
    child: Center(
        child: Padding(
      padding: EdgeInsets.all(size / 8),
      child: logoAmoi(size),
    )),
  );
}

// ==================================================================

Widget pdp(String uri, [double iconSize = 20, String src = 'NETWORK']) {
  return uri != ''
      ? src == 'NETWORK'
          ? ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.network(uri, fit: BoxFit.cover, scale: 1.0,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null));
              }),
            )
          : Image.asset(uri, fit: BoxFit.cover, scale: 1.0)
      : Container(
          color: Colors.white,
          child: Icon(Icons.person, color: Colors.black, size: iconSize),
        );
}
