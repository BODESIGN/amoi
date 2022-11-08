import 'dart:math';

import 'package:amoi/componantes/colors.dart';
import 'package:amoi/functions/connectivite.dart';
import 'package:amoi/functions/object.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';

String tableUserAmoi = 'amoi-user';
String tableBoiteAmoi = 'amoi-boite';
late USER userTask;

double montantNewBoite = 0.4;

Boite boiteNew = Boite(
    code: '',
    dateDreate: DateFormat('dd/MMM/yyyy HH:mm:ss.ZZ').format(DateTime.now()).toString(),
    // dateDreate: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    userCreator: userTask.login,
    nbEtage: 3,
    nbPlace: 14,
    nbPlaceOccuper: 13,
    detailsMembre: {
      userTask.login.toString(): {
        'upline': 'CREATOR',
        'listCodeChilds': [],
        'tokenFond': montantNewBoite,
        'etage': 2,
        'position': 7,
        'urlPdp': userTask.urlPdp
      },
    },
    minToken: 0.01,
    maxToken: 0.02);

// ====================================================================

void showToast(String msg, {int? duration = 3, int? gravity = Toast.top}) {
  Toast.show(msg, duration: duration, gravity: gravity);
}

// ====================================================================

Future<void> loading(bool isLoad) async {
  if (!isLoad) await EasyLoading.dismiss();
  if (!isLoad) return;
  await EasyLoading.show(
      status: 'Chargement ...', maskType: EasyLoadingMaskType.black);
}

// ====================================================================

copieOnPapierPressCode(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  showToast('Code copiée #$text');
}

// ====================================================================

bool amoiIsLoginValide(String login) {
  if (login.contains(' ')) return false;
  if (login.contains('#')) return false; // max -> ilaina any
  if (login.contains('\$')) return false;
  if (login.contains('\\')) return false;
  if (login.contains(',')) return false;
  if (login.contains('.')) return false;
  return true;
}

// ====================================================================

String numberFormat(double number, String unite) {
  return NumberFormat.currency(
          locale: 'fr',
          customPattern: '#.### \u00a4',
          symbol: unite,
          decimalDigits: 3)
      .format(number);
}

// ====================================================================

TextStyle vuTokenMontant = TextStyle(fontSize: 14, color: colorPrimary);
TextStyle vuTokenLabel =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300);

// ====================================================================

Future<bool> checLoginIsLibre(String loginForChec) async {
  bool isLibre = false;
  await FirebaseFirestore.instance
      .collection(tableUserAmoi)
      .doc(loginForChec)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (!documentSnapshot.exists) isLibre = true;
  });
  return isLibre;
}

// ====================================================================

Future<bool> newCompte(String login, String motDePasse) async {
  bool statutConnected = false;
  String erreur = '';

  bool isLoginLibre = await checLoginIsLibre(login);
  if (!isLoginLibre) showToast('login déjà pris');
  if (!isLoginLibre) loading(false);
  if (!isLoginLibre) return false;

  USER user =
      USER(login: login, password: motDePasse, token: 0.001, ariary: 0.001);

  await FirebaseFirestore.instance
      .collection(tableUserAmoi)
      .doc(login)
      .set(user.userAsMap())
      .then((value) => statutConnected = true)
      .catchError((error) => erreur = error);

  loading(false);
  if (!statutConnected) showToast('Erreur $erreur');
  if (!statutConnected) return false;

  return true;
}

// ====================================================================

String randomStringForCode(int length) {
  final random = Random();
  const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWYZ';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();
  return randomString;
}
String randomIntForCode(int length) {
  final random = Random();
  const availableChars = '0123456789';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();
  return randomString;
}

// ====================================================================

Future<List> clickConnect(
  String login,
  String motDePasse,
  bool isNewCompte,
  String motDePasse2,
) async {
  loading(true);

  if (login == '' || motDePasse == '') loading(false);
  if (login == '' || motDePasse == '') showToast('Information incomplet');
  if (login == '' || motDePasse == '') return [false, null];

  bool isHaveData = await checkData(showToast);
  if (!isHaveData) loading(false);
  if (!isHaveData) return [false, null];

  String mess = 'Mot de passe non correspondant';
  if (isNewCompte && motDePasse != motDePasse2) showToast(mess);
  if (isNewCompte && motDePasse != motDePasse2) loading(false);
  if (isNewCompte && motDePasse != motDePasse2) return [false, null];

  bool isSuccesCreate = false;
  if (isNewCompte) isSuccesCreate = await newCompte(login, motDePasse);
  if (isNewCompte) if (!isSuccesCreate) loading(false);
  if (isNewCompte) if (!isSuccesCreate) return [false, null];

  int statutConnected = 0;
  USER userRes = USER(login: '', password: '', token: 0.001, ariary: 0.001);

  await FirebaseFirestore.instance
      .collection(tableUserAmoi)
      .doc(login)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (!documentSnapshot.exists) return;
    late Map<String, dynamic> user;
    user = documentSnapshot.data() as Map<String, Object?>;
    if (motDePasse != user["password"] as String) statutConnected = 1;
    if (motDePasse != user["password"] as String) loading(false);
    if (motDePasse != user["password"] as String) return;
    statutConnected = 2;
    userRes = USER(
        login: user["login"] as String,
        password: user["password"] as String,
        token: user["token"] as double,
        ariary: user["ariary"] as double);
    userRes.fullname = user["fullname"] as String;
    userRes.urlPdp = user["urlPdp"] as String;
  }).onError((error, stackTrace) {});
  loading(false);
  if (statutConnected == 0) showToast('Compte inconnu');
  if (statutConnected == 0) return [false, null];
  if (statutConnected == 1) showToast('Mot de passe incorrect');
  if (statutConnected == 1) return [false, null];
  return [true, userRes];
}
