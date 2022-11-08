import 'package:amoi/componantes/utiles.dart';
import 'package:intl/intl.dart';

Map depot = {
  'user-code': {'date': 'JJ-MM-YYYY', 'montat': '20000', 'traiter': false}
};

// =============================================================

class USER {
  USER(
      {required this.login,
      required this.password,
      required this.token,
      required this.ariary});

  String login;
  String password;
  double ariary;
  double token;
  String fullname = '-';
  String urlPdp = '';

  userAsMap() {
    return {
      'login': login,
      'password': password,
      'ariary': ariary,
      'token': token,
      'fullname': fullname,
      'urlPdp': urlPdp,
    };
  }
}

// =============================================================

class Boite {
  String code;
  String dateDreate;
  String userCreator;
  int nbEtage;
  int nbPlace;
  int nbPlaceOccuper;
  List listMembre = [];
  List listMembreUriPdp = [];
  List<dynamic> listMembreEtage = [];
  Map detailsMembre;
  double minToken;
  double maxToken;
  double indicePercent = 45.56;
  double percentageBut = 45.56 * 5;

  Boite(
      {required this.code,
      required this.dateDreate,
      required this.userCreator,
      required this.nbEtage, // in create
      required this.nbPlace,
      required this.nbPlaceOccuper,
      required this.detailsMembre,
      required this.minToken, // in create
      required this.maxToken // in create
      }) {
    // update();
  }

  // ===========================================================

  asMap() {
    return {
      'code': code.toString(),
      'dateDreate': dateDreate,
      'userCreator': userCreator,
      'nbEtage': nbEtage,
      'nbPlace': nbPlace,
      'nbPlaceOccuper': nbPlaceOccuper,
      'detailsMembre': detailsMembre,
      'minToken': minToken,
      'maxToken': maxToken
    };
  }

  // ===========================================================

  List getListAvatars() {
    List res = [];

    detailsMembre.forEach((k, v) {
      res.add(v['urlPdp']);
    });

    return res;
  }

  // ===========================================================

  List toListDesign() {
    List res = [
      ['#', '#'],
      ['#', '#', '#', '#'],
      ['#', '#', '#', '#', '#', '#', '#', '#'],
    ];

    detailsMembre.forEach((k, v) {
      res[v['etage']][v['position']] = k;
    });
    return res;
  }

  // ===========================================================

  bool checMembre(String code) {
    bool res = false;
    detailsMembre.forEach((k, v) {
      if (k.toString() == code) {
        res = true;
        return;
      }
    });
    return res;
  }

  // ===========================================================

  double getProgressionChilds(String code) {
    int nbChild = code == '#MAX#' ? 2 : getNbChild(code);
    if (nbChild > 2) nbChild = 2;

    double progression = nbChild * indicePercent;
    return progression;
  }

  // ===========================================================

  double getProgressionPlace(String code) {
    int etage = code == '#MAX#' ? 0 : detailsMembre[code]['etage'];
    int etageProgress = 0;
    if (etage == 0) etageProgress = 2;
    if (etage == 1) etageProgress = 1;
    if (etage == 2) etageProgress = 0;

    double progression = etageProgress * indicePercent;
    return progression;
  }

  // ===========================================================

  double getProgression(String code) {
    return getProgressionPlace(code) +
        getProgressionChilds(code) +
        (code == '#MAX#' ? indicePercent : 0);
  }

  // ===========================================================

  double getMaxToken(String code) {
    double res = 0;
    res = getFond(code) * getProgression('#MAX#') / 100;
    return res;
  }

  // ===========================================================

  bool isHaveBonus(String code) {
    if ((getProgression('#MAX#') - indicePercent) == getProgression(code))
      return true;
    return false;
  }

  // ===========================================================

  int getEtage(String code) {
    int e = 0;
    for (var etage = 0; etage < listMembreEtage.length; etage++) {
      for (var c in listMembreEtage[etage]) {
        if (c.toString() == code) {
          e = etage;
        }
      }
    }
    if (e == 0) return 3;
    if (e == 1) return 2;
    if (e == 2) return 1;
    return 0;
  }

  // ===========================================================

  int getNbChild(String code) {
    if (checMembre(code) == false) return -1;
    //
    Map infos = detailsMembre[code];
    return infos['listCodeChilds'].length;
  }

  // ===========================================================

  double getFond(String code) {
    if (checMembre(code) == false) return 0.0;
    //
    Map infos = detailsMembre[code];
    return infos['tokenFond'];
  }

  // ===========================================================

  updateToNewFrom(
    String codeCreator,
    String uriPdpCreator,
    double tokenInvesti,
  ) {
    dateDreate= DateFormat('dd/MMM/yyyy HH:mm:ss.ZZ').format(DateTime.now()).toString();
    userCreator = codeCreator;
    // minToken = tokenInvesti <= 0 ? 0 : ;
    minToken = 0.1;
    maxToken = 0.3;
    detailsMembre = {
      codeCreator: {
        'upline': 'CREATOR',
        'listCodeChilds': [],
        'tokenFond': tokenInvesti,
        'etage': 2,
        'position': 7,
        'urlPdp': uriPdpCreator
      },
    };
  }

  // ===========================================================

  String genererCode() {
    return 'AMOI-B${randomStringForCode(8)}-${randomIntForCode(4)}-${randomIntForCode(2)}';
  }
}
