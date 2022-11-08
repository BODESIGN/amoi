import 'package:amoi/componantes/colors.dart';
import 'package:flutter/material.dart';

// =============================

Widget loginInput(double radius, double width, String label, controler,
    bool login_isValid, _login_isValid, helpLogin) {
  return SizedBox(
    width: width,
    height: 60,
    child: Material(
      elevation: 10,
      color: colorWhite,
      shadowColor: colorPrimaryShadow,
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: TextFormField(
              controller: controler,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              onChanged: (value) {
                _login_isValid();
              },
              decoration: InputDecoration(
                isDense: true,
                labelText: label,
                prefixIcon: const Icon(Icons.person),
                labelStyle: const TextStyle(fontWeight: FontWeight.normal),
                alignLabelWithHint: false,
                contentPadding: const EdgeInsets.all(15),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(0)),
                suffixIcon: !login_isValid
                    ? InkWell(
                        onTap: () {
                          helpLogin();
                        },
                        child: Icon(Icons.error, color: colorError))
                    : null,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// =============================

Widget loginMDP(
    double radius, double width, String label, controler, isObscur, actionPsw) {
  return SizedBox(
    width: width,
    height: 60,
    child: Material(
      elevation: 10,
      color: colorWhite,
      shadowColor: colorPrimaryShadow,
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: TextFormField(
            controller: controler,
            obscureText: isObscur,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              isDense: true,
              labelText: label,
              prefixIcon: const Icon(Icons.lock),
              labelStyle: const TextStyle(fontWeight: FontWeight.normal),
              alignLabelWithHint: false,
              contentPadding: const EdgeInsets.all(15),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(0)),
              suffixIcon: InkWell(
                  onTap: () {
                    actionPsw();
                  },
                  child: isObscur
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off)),
            ),
          )),
        ),
      ),
    ),
  );
}
