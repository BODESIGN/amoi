import 'package:amoi/componantes/buttons.dart';
import 'package:amoi/componantes/checboxs.dart';
import 'package:amoi/componantes/images.dart';
import 'package:amoi/componantes/inputs.dart';
import 'package:flutter/material.dart';

// se connect
Widget paneSeconnect_1(
    BuildContext context,
    TextEditingController login,
    TextEditingController mdp,
    bool isObscurMdp,
    _isObscurMdp,
    bool isRemember,
    _isRemember,
    _seConnect,
    _newCompt,
    bool login_isValid,
    _login_isValid,
    _helpLogin) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // container Logo
            const SizedBox(height: 80),
            Center(
                child: Column(
              children: [
                SizedBox(width: 60, child: logoContainer(60)),
                const SizedBox(height: 10),
                const Text('AMOI Groupe',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))
              ],
            )),
            const SizedBox(height: 80),

            // Container Inputs
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: loginInput(15, MediaQuery.of(context).size.width,
                    'Login', login, login_isValid, _login_isValid, _helpLogin)),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: loginMDP(15, MediaQuery.of(context).size.width,
                    'Mot de passe', mdp, isObscurMdp, _isObscurMdp)),

            // container Button
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: button('Se connecter', _seConnect)),

            const SizedBox(height: 10),
            // container Button 2
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonText('Créer un compte', _newCompt),
                    checBox(context, isRemember, 'Memoriser', _isRemember),
                  ]),
            ),
          ]));
}

// ===========================================================================

// new COMPTE --> login

Widget paneSeconnect_2(
  BuildContext context,
  TextEditingController loginNew,
  _next,
  _back,
  bool loginNew_isValid,
  _login_isValid,
  _helpLogin,
) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // container Logo
            const SizedBox(height: 80),
            Center(
                child: Column(
              children: [
                SizedBox(width: 60, child: logoContainer(60)),
                const SizedBox(height: 10),
                const Text('AMOI Groupe',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))
              ],
            )),
            const SizedBox(height: 80),
            const Text("Création d'une compte",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            const SizedBox(height: 15),
            Container(color: Colors.grey, width: 50, height: 1),
            const SizedBox(height: 20),

            // Container Inputs
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: loginInput(
                    15,
                    MediaQuery.of(context).size.width,
                    'Nouveau Login',
                    loginNew,
                    loginNew_isValid,
                    _login_isValid,
                    _helpLogin)),

            // container Button
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: button('Valider login', _next)),

            const SizedBox(height: 10),
            // container Button 2
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // const Icon(Icons.arrow_left),
                        buttonText('Retour', _back),
                      ],
                    ),
                    const SizedBox()
                  ]),
            ),
          ]));
}

// ===========================================================================

// new compte ---> new mdp

Widget paneSeconnect_3(
  BuildContext context,
  TextEditingController mdpNew,
  bool isObscurMdp,
  _isObscurMdp,
  _next,
  _back,
) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // container Logo
            const SizedBox(height: 80),
            Center(
                child: Column(
              children: [
                SizedBox(width: 60, child: logoContainer(60)),
                const SizedBox(height: 10),
                const Text('AMOI Groupe',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))
              ],
            )),
            const SizedBox(height: 80),
            const Text("Création d'une compte",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            const SizedBox(height: 15),
            Container(color: Colors.grey, width: 50, height: 1),
            const SizedBox(height: 20),

            // Container Inputs
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: loginMDP(15, MediaQuery.of(context).size.width,
                    'Nouveau Mot de passe', mdpNew, isObscurMdp, _isObscurMdp)),

            // container Button
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: button('Valider mot de passe', _next)),

            const SizedBox(height: 10),
            // container Button 2
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // const Icon(Icons.arrow_left),
                        buttonText('Retour', _back),
                      ],
                    ),
                    const SizedBox()
                  ]),
            ),
          ]));
}

// ===========================================================================

// new compte ---> new mdp -> VALIDE NEW COMPTE

Widget paneSeconnect_4(
  BuildContext context,
  TextEditingController mdpNew,
  bool isObscurMdp,
  _isObscurMdp,
  _next,
  _back,
  bool isRemember,
  _isRemember,
) {
  return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // container Logo
            const SizedBox(height: 80),
            Center(
                child: Column(
              children: [
                SizedBox(width: 60, child: logoContainer(60)),
                const SizedBox(height: 10),
                const Text('AMOI Groupe',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17))
              ],
            )),
            const SizedBox(height: 80),
            const Text("Création d'une compte",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            const SizedBox(height: 15),
            Container(color: Colors.grey, width: 50, height: 1),
            const SizedBox(height: 20),

            // Container Inputs
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: loginMDP(
                    15,
                    MediaQuery.of(context).size.width,
                    'Nouveau Mot de passe (confirmation)',
                    mdpNew,
                    isObscurMdp,
                    _isObscurMdp)),

            // container Button
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: button('Créer mon compte & Se connecter', _next)),

            const SizedBox(height: 10),
            // container Button 2
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonText('Retour', _back),
                    checBox(context, isRemember, 'Memoriser', _isRemember),
                  ]),
            ),
          ]));
}
