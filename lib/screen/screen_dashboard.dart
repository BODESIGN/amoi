// ignore_for_file: non_constant_identifier_names

import 'package:amoi/brouillont.dart';
import 'package:amoi/componantes/buttons.dart';
import 'package:amoi/componantes/caroselle.dart';
import 'package:amoi/componantes/colors.dart';
import 'package:amoi/componantes/images.dart';
import 'package:amoi/componantes/modales.dart';
import 'package:amoi/componantes/utiles.dart';
import 'package:amoi/functions/boites.dart';
import 'package:amoi/functions/object.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  late BuildContext myContext;
  final h1 = 300.0;
  final h2 = 30.0;
  final h3 = 80.0;

  CarouselController controler = CarouselController();
  int indexSelected = 0;
  _currentIndex(int i) => setState(() => indexSelected = i);

  late USER user;

  List<Widget> listVuBoites(BuildContext context) {
    List<Boite> mesBoites = selectListBoite(user.login);
    List<Widget> res = [];
    for (var boite in mesBoites) {
      res.add(designBoiteCarouselleRow(boite, user.login));
    }
    return res;
  }

  _test() => print('test');
  _nothing() {}

// ==============================================================

  _downmontantNewBoite() {
    if (montantNewBoite < 0.1) return;
    Navigator.of(myContext).pop();
    montantNewBoite - 0.1;
    boiteNew.detailsMembre[user.login]['tokenFond'] = montantNewBoite;
    _modaleCreateboiteNew();
  }

  _upmontantNewBoite() {
    if (montantNewBoite > 49.1) return;
    Navigator.of(myContext).pop();
    montantNewBoite + 0.1;
    boiteNew.detailsMembre[user.login]['tokenFond'] = montantNewBoite;
    _modaleCreateboiteNew();
  }

  _pushboiteNew() async {
    bool isCreer = await newBoitePushDB(boiteNew);
    if (isCreer) showToast('Nouveau Boite Créé');
    // TODO update USER
    // TODO  getListBoite
  }

  _cancelNew() {
    Navigator.of(myContext).pop();
  }

  _modaleCreateboiteNew() {
    userTask = user;
    boiteNew.updateToNewFrom(user.login, user.urlPdp, montantNewBoite);

    Widget modal = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text("Créeation d'une nouvelle boite",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: colorPrimary,
            )),

        // subtitle
        Text('Information de la boite',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: colorBlack,
            )),

        // design Row

        // design Etage
        Column(children: [
          // etage 1
          designBoiteEtage(boiteNew.toListDesign()[0], user.login,
              boiteNew.detailsMembre[user.login]['listCodeChilds']),
          // etage 2
          designBoiteEtage(boiteNew.toListDesign()[1], user.login,
              boiteNew.detailsMembre[user.login]['listCodeChilds']),
          // etage 3
          designBoiteEtage(boiteNew.toListDesign()[2], user.login,
              boiteNew.detailsMembre[user.login]['listCodeChilds']),
        ]),

        // choix Font
        Row(
          children: [
            buttonSecound(Icons.arrow_drop_down, _upmontantNewBoite, false),
            Text(
                "Fond : ${boiteNew.detailsMembre[user.login]['tokenFond']} Tk"),
            buttonSecound(Icons.arrow_drop_up, _downmontantNewBoite, false),
          ],
        ),

        // Action
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button('Valider', _pushboiteNew),
            button('Annuler', _cancelNew),
          ],
        ),
      ],
    );
    showModal_Container(myContext, modal);
  }

// ==============================================================
  _clickboiteNew() => showModal_Buttons(
      myContext,
      'Créer une boite',
      'Créer ou rejoindre une boite',
      _modaleCreateboiteNew,
      true,
      "Créeation d'une boite",
      _test,
      true,
      "Réjoindre une boite",
      _nothing,
      true,
      "Annuler");

  // ===========================================

  @override
  void initState() {
    loading(false);
    setState(() => user = userTask);
    super.initState();
  }

  // ===========================================

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    setState(() => myContext = context);

    return SafeArea(
        child: Scaffold(
            backgroundColor: colorPrimaryBg,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // CARD profile
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                      width: double.infinity,
                      height: h1 - (10 * 2) - 20,
                      child: Material(
                          elevation: 10,
                          color: colorWhite,
                          shadowColor: colorPrimaryShadow,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                // action :: 50
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buttonIcon(Icons.short_text, _test, 50),
                                      // buttonIcon(Icons.badge, _test, 50)
                                    ]),

                                // pdp :: 70
                                Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                            color: colorPrimaryBg, width: 3)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: pdp(user.urlPdp))),

                                // nom - login 10 + 40
                                const SizedBox(height: 10),
                                SizedBox(
                                    height: 40,
                                    child: Column(children: [
                                      Text(user.fullname,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: colorPrimary)),
                                      Text('#${user.login}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: TextStyle(
                                              fontSize: 11, color: colorBlack))
                                    ])),

                                // token - argent 20 + 40
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                          flex: 2,
                                          fit: FlexFit.tight,
                                          child: Column(children: [
                                            Text(numberFormat(user.token, ''),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: vuTokenMontant),
                                            Text('Token', style: vuTokenLabel)
                                          ])),
                                      Container(
                                          color: colorSecondary,
                                          width: 1,
                                          height: 40),
                                      Flexible(
                                          flex: 2,
                                          fit: FlexFit.tight,
                                          child: Column(children: [
                                            Text(numberFormat(user.ariary, ''),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: vuTokenMontant),
                                            Text('Ariary', style: vuTokenLabel)
                                          ]))
                                    ])
                              ]))))),

              // separateur -> titre boite
              SizedBox(
                  height: h2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          const SizedBox(width: 30),
                          Text('Mes Boites',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: colorPrimary))
                        ]),
                        Row(children: [
                          buttonText('Aide', _test),
                          Icon(Icons.help, size: 20, color: colorWarnig),
                          const SizedBox(width: 30)
                        ])
                      ])),

              // list BOITE
              SizedBox(
                  child: CAROUSEL_BOITE(
                      context,
                      controler,
                      listVuBoites(context),
                      _currentIndex,
                      MediaQuery.of(context).size.height - (h1 + h2 + h3 + 25),
                      indexSelected)),

              // boutton :: action BOITE
              SizedBox(
                  height: h3,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              SizedBox(
                                  width: h3 - 25,
                                  child: buttonSecound(
                                      Icons.add, _clickboiteNew, true)),
                              SizedBox(
                                  width: h3 - 25,
                                  child:
                                      buttonSecound(Icons.search, _test, false))
                            ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('by BO Studio MADAGASCAR',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10)),
                                  Text('v-122422',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w100,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10))
                                ])
                          ])))
            ])));
  }
}
