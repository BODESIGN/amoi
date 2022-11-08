import 'package:amoi/componantes/colors.dart';
import 'package:flutter/material.dart';

Widget button(String text, function) {
  double height = 55;
  return SizedBox(
    height: height,
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.circular(height / 2)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.blue,
            borderRadius: BorderRadius.circular(height / 2),
            onTap: (() {
              function();
            }),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Text(
                  text,
                  style: TextStyle(color: colorWhite),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// ======================================================================

Widget buttonText(String text, function) {
  double height = 30;
  return SizedBox(
    height: height,
    child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(color: colorBlack))),
  );
}

// ======================================================================

Widget buttonIcon(IconData icon, function, double size) {
  return SizedBox(
    height: size,
    width: size,
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(size / 2)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.blue,
            borderRadius: BorderRadius.circular(size / 2),
            onTap: (() {
              function();
            }),
            child: Center(
              child: Icon(icon, color: colorPrimary),
            ),
          ),
        ),
      ),
    ),
  );
}

// ==========================================================================

Widget buttonSecound(IconData icon, function, bool isPrimary) {
  double height = 55;
  return SizedBox(
    height: height,
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            color: isPrimary ? colorPrimary : colorWhite,
            borderRadius: BorderRadius.circular(height / 4),
            border: Border.all(color: colorSecondary, width: 1)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.blue,
            borderRadius: BorderRadius.circular(height / 4),
            onTap: (() {
              function();
            }),
            child: Center(
              child: Icon(
                icon,
                color: isPrimary ? colorWhite : colorPrimary,
                size: height / 3,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
