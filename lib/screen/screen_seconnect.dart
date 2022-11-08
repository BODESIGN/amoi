// ignore_for_file: non_constant_identifier_names

import 'package:amoi/componantes/caroselle.dart';
import 'package:amoi/componantes/colors.dart';
import 'package:amoi/componantes/utiles.dart';
import 'package:amoi/functions/object.dart';
import 'package:amoi/functions/prefs.dart';
import 'package:amoi/panels/pane_seconnect.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ScreenSeConnect extends StatefulWidget {
  const ScreenSeConnect({super.key});

  @override
  State<ScreenSeConnect> createState() => _ScreenSeConnectState();
}

class _ScreenSeConnectState extends State<ScreenSeConnect> {
  late BuildContext myContext;

  final login = TextEditingController();
  bool login_isValid = true;
  _login_isValid() =>
      setState(() => login_isValid = amoiIsLoginValide(login.text));

  final mdp = TextEditingController();
  bool isObscurMdp = true;
  _isObscurMdp() => setState(() => isObscurMdp = !isObscurMdp);

  final loginNew = TextEditingController();
  bool loginNew_isValid = true;
  _loginNew_isValid() =>
      setState(() => loginNew_isValid = amoiIsLoginValide(loginNew.text));

  final mdpNew = TextEditingController();
  final mdpNewValide = TextEditingController();

  bool isRemember = false;
  _isRemember() => setState(() => isRemember = !isRemember);

  // carrousel
  CarouselController controler = CarouselController();
  int indexSelected = 0;
  Duration d = const Duration(milliseconds: 1);
  _currentIndex(int i) => setState(() => indexSelected = i);
  _next() => controler.nextPage(duration: d, curve: Curves.ease);
  _prev() => controler.previousPage(duration: d, curve: Curves.ease);

  // =======================================================================

  void _saveLogin(String plogin, String pmotDePasse) {
    prefsSetSaved(isRemember, plogin, pmotDePasse);
  }
  // =======================================================================

  goToDashboard(USER user) {
    userTask = user;
    Navigator.pushNamed(myContext, '/dashboard');
  }

  // =======================================================================

  _seConnect() async {
    if (!login_isValid) return;
    // se connect
    List res;
    res = await clickConnect(login.text, mdp.text, false, '');
    if (res[0]) goToDashboard(res[1]);

    // save PREFS
    if (res[0]) _saveLogin(login.text, mdp.text);
  }
  // =======================================================================

  _newCompt() async {
    // se connect
    List res;
    res =
        await clickConnect(loginNew.text, mdpNew.text, true, mdpNewValide.text);
    if (res[0]) goToDashboard(res[1]);

    // save PREFS
    if (res[0]) _saveLogin(loginNew.text, mdpNew.text);
  }

  // =======================================================================

  _helpLogin() {
    print('show modal : help login');
  }

  // =======================================================================

  _newComptChecLoginNew() async {
    if (loginNew.text == '') return;
    if (!loginNew_isValid) return;

    // chec login not occuped in DB
    loading(true);
    bool isLoginLibre = await checLoginIsLibre(loginNew.text);
    loading(false);

    if (!isLoginLibre) showToast('login déjà pris');
    if (!isLoginLibre) return;

    // pass
    _next();
  }

  // =======================================================================

  _newComptChecMdpNew() {
    if (mdpNew.text == '') return;
    _next();
  }

  // =======================================================================

  List<Widget> panels(context) {
    return [
      // se connect
      paneSeconnect_1(
          context,
          login,
          mdp,
          isObscurMdp,
          _isObscurMdp,
          isRemember,
          _isRemember,
          _seConnect,
          _next,
          login_isValid,
          _login_isValid,
          _helpLogin),

      // new COMPTE --> login
      paneSeconnect_2(context, loginNew, _newComptChecLoginNew, _prev,
          loginNew_isValid, _loginNew_isValid, _helpLogin),

      // new compte ---> new mdp
      paneSeconnect_3(context, mdpNew, isObscurMdp, _isObscurMdp,
          _newComptChecMdpNew, _prev),

      // new compte ---> new mdp -> VALIDE NEW COMPTE
      paneSeconnect_4(context, mdpNewValide, isObscurMdp, _isObscurMdp,
          _newCompt, _prev, isRemember, _isRemember)
    ];
  }

  // =======================================================================

  checSaved(BuildContext context) async {
    // chec Prefs
    List prefs = await prefsGetSaved();

    // se connect To prefs
    if (prefs[0] != true) return;

    setState(() => isRemember = prefs[0]);
    setState(() => login.text = prefs[1]);
    // setState(() => mdp.text = prefs[2]);
  }

  // =======================================================================

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    setState(() => myContext = context);

    return FutureBuilder(
      future: checSaved(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: colorPrimaryBg,
              body: CAROUSEL(context, controler, panels(context),
                  MediaQuery.of(context).size.height, _currentIndex)),
        );
      },
    );
  }
}
