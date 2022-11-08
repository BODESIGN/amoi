
import 'functions/object.dart';

List<Boite> selectListBoite(String userCode) {
  List<Boite> listBoites = [];
  listBoites = [
    Boite(
      code: 'BTSKJDZHBBSNDGBJSBYT',
      dateDreate: '12/13/2059',
      nbEtage: 3,
      nbPlace: 14,
      nbPlaceOccuper: 5,
      minToken: 0.033,
      maxToken: 0.041,
      userCreator: 'Adam',
      // listMembre: ['a', 'Lenora', 'Hester', 'Lena', 'Jeremiah'],
      // listMembreUriPdp: [
      //   'https://i.pravatar.cc/150?img=1',
      //   'https://i.pravatar.cc/150?img=2',
      //   'https://i.pravatar.cc/150?img=3',
      //   'https://i.pravatar.cc/150?img=4',
      //   'https://i.pravatar.cc/150?img=5'
      // ],
      // listMembreEtage: [
      //   ['a', 'Lenora'],
      //   ['Hester', 'Lena', 'Jeremiah', null],
      //   [null, null, null, null, null, null, null, null, null],
      // ],
      detailsMembre: {
        'a': {
          'upline': 'Adam',
          'listCodeChilds': ['Lenora', 'Lena'],
          'tokenFond': 0.04,
          'etage': 0,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=1'
        },
        'Lenora': {
          'upline': 'a',
          'listCodeChilds': ['Hester'],
          'tokenFond': 0.041,
          'etage': 0,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=2'
        },
        'Lena': {
          'upline': 'a',
          'listCodeChilds': ['Jeremiah'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=3'
        },
        'Hester': {
          'upline': 'Lenora',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=4'
        },
        'Jeremiah': {
          'upline': 'Lena',
          'listCodeChilds': [],
          'tokenFond': 0.040,
          'etage': 1,
          'position': 2,
          'urlPdp': 'https://i.pravatar.cc/150?img=6'
        },
      },
    ),
    Boite(
      code: 'KJQDHDJDNCBC13H3DHDJ',
      dateDreate: '3/7/2098',
      nbEtage: 3,
      nbPlace: 14,
      nbPlaceOccuper: 11,
      minToken: 0.033,
      maxToken: 0.041,
      userCreator: 'Rhoda',
      // listMembre: [
      //   'Rhoda',
      //   'a',
      //   'Lenora',
      //   'Hester',
      //   'Lena',
      //   'Jeremiah',
      //   'Julia',
      //   'Max',
      //   'Rose',
      //   'Samuel',
      //   'Bernice'
      // ],
      // listMembreUriPdp: [
      //   'https://i.pravatar.cc/150?img=1',
      //   'https://i.pravatar.cc/150?img=2',
      //   'https://i.pravatar.cc/150?img=3',
      //   'https://i.pravatar.cc/150?img=4',
      //   'https://i.pravatar.cc/150?img=5',
      //   'https://i.pravatar.cc/150?img=6',
      //   'https://i.pravatar.cc/150?img=7',
      //   'https://i.pravatar.cc/150?img=8',
      //   'https://i.pravatar.cc/150?img=9',
      //   'https://i.pravatar.cc/150?img=10',
      //   'https://i.pravatar.cc/150?img=11'
      // ],
      // listMembreEtage: [
      //   ['Rhoda', 'a'],
      //   ['Lenora', 'Hester', 'Lena', 'Jeremiah'],
      //   ['Julia', 'Max', 'Rose', 'Samuel', 'Bernice', null, null, null],
      // ],
      detailsMembre: {
        'Rhoda': {
          'upline': 'CREATOR',
          'listCodeChilds': ['a', 'Lenora'],
          'tokenFond': 0.033,
          'etage': 0,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=3'
        },
        'a': {
          'upline': 'Rhoda',
          'listCodeChilds': ['Hester', 'Lena'],
          'tokenFond': 0.033,
          'etage': 0,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=4'
        },
        'Lenora': {
          'upline': 'Rhoda',
          'listCodeChilds': ['Jeremiah', 'Julia'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=5'
        },
        'Hester': {
          'upline': 'a',
          'listCodeChilds': ['Max', 'Rose'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=8'
        },
        'Lena': {
          'upline': 'a',
          'listCodeChilds': ['Samuel', 'Bernice'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 2,
          'urlPdp': 'https://i.pravatar.cc/150?img=19'
        },
        'Jeremiah': {
          'upline': 'Lenora',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 3,
          'urlPdp': 'https://i.pravatar.cc/150?img=9'
        },
        'Julia': {
          'upline': 'Lenora',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=18'
        },
        'Max': {
          'upline': 'Hester',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=14'
        },
        'Rose': {
          'upline': 'Hester',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 2,
          'urlPdp': 'https://i.pravatar.cc/150?img=1'
        },
        'Samuel': {
          'upline': 'Lena',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 3,
          'urlPdp': 'https://i.pravatar.cc/150?img=20'
        },
        'Bernice': {
          'upline': 'Lena',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 4,
          'urlPdp': 'https://i.pravatar.cc/150?img=17'
        },
      },
    ),
    Boite(
      code: 'DCCHZNXBSKN899NJ7NS0',
      dateDreate: '3/14/2035',
      nbEtage: 3,
      nbPlace: 14,
      nbPlaceOccuper: 8,
      minToken: 0.033,
      maxToken: 0.041,
      userCreator: 'Sean',
      // listMembre: [
      //   'Hester',
      //   'Lena',
      //   'Jeremiah',
      //   'Julia',
      //   'Max',
      //   'Sean',
      //   'Rhoda',
      //   'a',
      // ],
      // listMembreUriPdp: [
      //   'https://i.pravatar.cc/150?img=1',
      //   'https://i.pravatar.cc/150?img=2',
      //   'https://i.pravatar.cc/150?img=3',
      //   'https://i.pravatar.cc/150?img=4',
      //   'https://i.pravatar.cc/150?img=5',
      //   'https://i.pravatar.cc/150?img=6',
      //   'https://i.pravatar.cc/150?img=7',
      //   'https://i.pravatar.cc/150?img=0',
      // ],
      // listMembreEtage: [
      //   ['Hester', 'Lena'],
      //   ['Jeremiah', 'Julia', 'Max', 'ShawnSean'],
      //   ['Rhoda', 'a', null, null, null, null, null, null],
      // ],
      detailsMembre: {
        'Hester': {
          'upline': 'Sean',
          'listCodeChilds': ['Lena', 'Jeremiah'],
          'tokenFond': 0.033,
          'etage': 0,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=9'
        },
        'Lena': {
          'upline': 'Hester',
          'listCodeChilds': ['Julia', 'Max'],
          'tokenFond': 0.033,
          'etage': 0,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=11'
        },
        'Jeremiah': {
          'upline': 'Hester',
          'listCodeChilds': ['ShawnSean', 'Rhoda'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=30'
        },
        'Julia': {
          'upline': 'Lena',
          'listCodeChilds': ['a'],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=29'
        },
        'Max': {
          'upline': 'Lena',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 2,
          'urlPdp': 'https://i.pravatar.cc/150?img=22'
        },
        'ShawnSean': {
          'upline': 'Jeremiah',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 1,
          'position': 3,
          'urlPdp': 'https://i.pravatar.cc/150?img=25'
        },
        'Rhoda': {
          'upline': 'Jeremiah',
          'listCodeChilds': [],
          'tokenFond': 0.033,
          'etage': 2,
          'position': 0,
          'urlPdp': 'https://i.pravatar.cc/150?img=19'
        },
        'a': {
          'upline': 'Julia',
          'listCodeChilds': [],
          'tokenFond': 0.031,
          'etage': 2,
          'position': 1,
          'urlPdp': 'https://i.pravatar.cc/150?img=27'
        },
      },
    ),
  ];
  return listBoites;
}
