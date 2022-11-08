import 'package:amoi/componantes/colors.dart';
import 'package:flutter/material.dart';

Widget checBox(BuildContext context, bool value, String text, chec) {
  return Row(children: [
    Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeColor: colorSucces,
        shape: const CircleBorder(),
        value: value,
        onChanged: ((value) {
          chec();
        })),
    TextButton(
        onPressed: () {
          chec();
        },
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(color: colorPrimary)))
  ]);
}
