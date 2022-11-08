// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

Color _bgColor = const Color.fromRGBO(245, 247, 251, 1);

// =============================================================================
// ->   separator
// =============================================================================

SizedBox separator(String _cote, double _size) {
  return SizedBox(
    height: _cote == 'H' ? _size : 0,
    width: _cote == 'W' ? _size : 0,
  );
}

Widget separatorLine() {
  return Container(
    color: Colors.grey[300],
    height: 1,
    width: double.maxFinite,
  );
}
