// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle styleTitle = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black);
TextStyle styleNormal = const TextStyle(
    fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black);

// modal MODELE 1 -> 3 button
showModal_Buttons(
  BuildContext context,
  String title,
  String subTitle,
  _action1,
  bool closable1,
  String labelButton1,
  _action2,
  bool closable2,
  String labelButton2,
  _action3,
  bool closable3,
  String labelButton3,
) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
              title: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
              message: Text(subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey)),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  isDefaultAction: true,
                  onPressed: () {
                    if (closable1) Navigator.pop(context);
                    _action1();
                  },
                  child: Text(labelButton1,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    if (closable2) Navigator.pop(context);
                    _action2();
                  },
                  child: Text(labelButton2,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                CupertinoActionSheetAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      if (closable3) Navigator.pop(context);
                      _action3();
                    },
                    child: Text(labelButton3,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)))
              ]));
}

// ===========================================================================================

showModal_Container(BuildContext context, Widget child) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black12,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Container(
                color: Colors.white,
                child:
                    Padding(padding: const EdgeInsets.all(8.0), child: child)));
      });
}

