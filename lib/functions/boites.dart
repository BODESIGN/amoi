// ignore_for_file: non_constant_identifier_names

import 'package:amoi/componantes/buttons.dart';
import 'package:amoi/componantes/colors.dart';
import 'package:amoi/componantes/utiles.dart';
import 'package:amoi/functions/connectivite.dart';
import 'package:amoi/functions/object.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:avatar_stack/avatar_stack.dart';

Widget designBoiteCarouselleRow(Boite boite, String codeUserActif) {
  List childOfActif = boite.detailsMembre[codeUserActif]['listCodeChilds'];

  List pdpUri = boite.getListAvatars();

  return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
          splashColor: Colors.blue[300],
          onTap: () {
            print(boite.isHaveBonus(codeUserActif));
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Header
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(Icons.folder_shared),
                              const SizedBox(width: 8),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(boite.code,
                                        style: const TextStyle(fontSize: 12)),
                                    Text(boite.dateDreate,
                                        style: const TextStyle(fontSize: 8))
                                  ])
                            ]),
                        const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(value: .7)),
                        ),
                      ]),

                  // separator
                  const SizedBox(height: 10),
                  Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.black12),
                  const SizedBox(height: 10),

                  // design Etage
                  Column(children: [
                    // etage 1
                    designBoiteEtage(
                        boite.toListDesign()[0], codeUserActif, childOfActif),
                    // etage 2
                    designBoiteEtage(
                        boite.toListDesign()[1], codeUserActif, childOfActif),
                    // etage 3
                    designBoiteEtage(
                        boite.toListDesign()[2], codeUserActif, childOfActif),
                  ]),

                  // separator
                  const SizedBox(height: 10),
                  Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.black12),
                  const SizedBox(height: 10),

                  // legende
                  Row(children: [
                    Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.green, width: 2),
                            color: Colors.green)),
                    const Text(' : Moi'),
                    const SizedBox(width: 10),
                    Opacity(
                      opacity: .4,
                      child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.green, width: 2),
                              color: Colors.green)),
                    ),
                    const Text(' : Mes childs'),
                    const SizedBox(width: 10),
                  ]),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              color: Colors.black26)),
                      const Text(' : Autre'),
                      const SizedBox(width: 10),
                      Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border:
                                  Border.all(color: Colors.black26, width: 2),
                              color: Colors.transparent)),
                      const Text(' : Place Libre'),
                      const SizedBox(width: 10),
                    ],
                  ),

                  // separator
                  const SizedBox(height: 10),
                  Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.black12),
                  const SizedBox(height: 10),

                  // mes infos
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // info :=> FOND
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.person,
                                          color: Colors.blue, size: 15),
                                    )),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Place',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        '${boite.detailsMembre[codeUserActif]['etage'] + 1}e Etage',
                                        style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                '${numberFormat(boite.getProgressionPlace(codeUserActif), '')} %',
                                style: const TextStyle(fontSize: 11)),
                          ],
                        ),

                        // separator
                        const SizedBox(height: 2),
                        Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.black12),
                        const SizedBox(height: 2),

                        // info :=> Childs
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.group,
                                          color: Colors.blue, size: 15),
                                    )),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Childs invités',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        'Nombre : ${boite.detailsMembre[codeUserActif]['listCodeChilds'].length} ',
                                        style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                '${numberFormat(boite.getProgressionChilds(codeUserActif), '')} %',
                                style: const TextStyle(fontSize: 11)),
                          ],
                        ),

                        // separator
                        const SizedBox(height: 2),
                        Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.black12),
                        const SizedBox(height: 2),

                        // infon :=> total
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.trending_up,
                                          color: Colors.blue, size: 20),
                                    )),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Totale',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    Text('(Bonus)',
                                        style: TextStyle(fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    '${numberFormat(boite.getProgression(codeUserActif), '')} %',
                                    style: const TextStyle(fontSize: 11)),
                                Text(
                                    '(+${boite.isHaveBonus(codeUserActif) ? numberFormat(boite.indicePercent, '') : 0} %)',
                                    style: const TextStyle(fontSize: 11)),
                              ],
                            ),
                          ],
                        ),

                        // separator
                        const SizedBox(height: 2),
                        Container(
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.black12),
                        const SizedBox(height: 10),

                        // totale
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fond : ${boite.getFond(codeUserActif)} Tk'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                        'Max possible : ${numberFormat(boite.getProgression('#MAX#'), '')} %',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                        'Token max : ${numberFormat(boite.getMaxToken(codeUserActif), 'Tk')}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: colorSucces,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // separator
                  const SizedBox(height: 10),
                  Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.black12),
                  const SizedBox(height: 2),

                  // les avatares des membres
                  AvatarStack(height: 20, avatars: [
                    for (var n = 0; n < pdpUri.length; n++)
                      NetworkImage(pdpUri[n])
                  ])
                ]),
          )));
}

// =======================================================

Widget icon(String pseudo, List childOfActif) {
  bool isChildOfActif = childOfActif.contains(pseudo);
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Opacity(
      opacity: isChildOfActif ? .4 : 1,
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              color: pseudo == 'ACTIF' || isChildOfActif
                  ? Colors.green
                  : pseudo == '#'
                      ? Colors.black26
                      : Colors.transparent,
              width: 2),
          color: pseudo == '#'
              ? Colors.transparent
              : pseudo == 'ACTIF' || isChildOfActif
                  ? Colors.green
                  : Colors.black26,
        ),
      ),
    ),
  );
}

// =======================================================

Row designBoiteEtage(
  List pseudoEtage,
  String codeUsetActif,
  List childOfActif,
) {
  List<Widget> icons = [];
  for (var code in pseudoEtage) {
    icons.add(code.toString() == codeUsetActif
        ? icon('ACTIF', childOfActif)
        : icon(code, childOfActif));
  }

  return Row(
    children: icons,
  );
}

// =====================================================================
// DATABASE FIREBASE -> boite only
// =====================================================================

Future<bool> newBoitePushDB(Boite newBoiteForPush) async {
  bool statutConnected = false;
  String erreur = '';

  loading(true);

  bool isHaveData = await checkData(showToast);
  if (!isHaveData) loading(false);
  if (!isHaveData) return false;

  newBoiteForPush.code = newBoiteForPush.genererCode();

  await FirebaseFirestore.instance
      .collection(tableBoiteAmoi)
      .doc(newBoiteForPush.code)
      .set(newBoiteForPush.asMap())
      .then((value) => statutConnected = true)
      .catchError((error) => erreur = error);

  loading(false);
  if (!statutConnected) showToast('Erreur $erreur');
  if (!statutConnected) return false;

  return true;
}
