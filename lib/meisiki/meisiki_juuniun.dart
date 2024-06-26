import 'package:flutter/material.dart';
import 'package:sanch6a/kansuu.dart';
import 'package:sanch6a/niti_si2.dart';

import '../niti_kan.dart';
import '../niti_si.dart';

class MeisikiJuuniun extends StatefulWidget {
  final int seinenInt;
  final int seigatuInt;
  final int seinitiInt;
  final int aiteInt;  //6.1.16

  const MeisikiJuuniun({
    super.key,
    required this.seinenInt,
    required this.seigatuInt,
    required this.seinitiInt,
    required this.aiteInt,  //6.1.16
  });

  @override
  MeisikiJuuniunState createState() => MeisikiJuuniunState();
}

class MeisikiJuuniunState extends State<MeisikiJuuniun> {
  late int seinenInt = 2000; // 6.1.15
  late int seigatuInt = 1; //   6.1.15
  late int seinitiInt = 1; //   6.1.15
  late int aiteInt = 0;   //6.1.16
  final _listExpanded = [true, false, false, false, false];

  void _togglePanel(int index) {
    setState(() {
      //for (int i = 0; i < _listExpanded.length; i++ ) {
      //  _listExpanded[i] = i == index ? !_listExpanded[i] : false;
      if (index == 0) {
        _listExpanded[0] = !_listExpanded[0];
      } else if (index == 1) {
        _listExpanded[1] = !_listExpanded[1];
      } else if (index == 2) {
        _listExpanded[2] = !_listExpanded[2];
      } else if (index == 3) {
        _listExpanded[3] = !_listExpanded[3];
      } else {
        _listExpanded[4] = !_listExpanded[4];
      }
    });
  }

  void _closePanel(int index) {
    setState(() {
      _listExpanded[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    seinenInt = widget.seinenInt; // 6.1.15
    seigatuInt = widget.seigatuInt; // 6.1.15
    seinitiInt = widget.seinitiInt; // 6.1.15
    aiteInt = widget.aiteInt; // 6.1.16

    /*List<Widget> nks = [  // 日干からみた性質リスト
      nks0,
      nks1,
      nks2,
      nks3,
      nks4,
      nks5,
      nks6,
      nks7,
      nks8,
      nks9,
    ];*/
    List<Widget> nsu = [
      nsu0,
      nsu1,
      nsu2,
      nsu3,
      nsu4,
      nsu5,
      nsu6,
      nsu7,
      nsu8,
      nsu9,
      nsu10,
      nsu11,
    ];
    List<Widget> nss = [
      nss0,
      nss1,
      nss2,
    ];

    String aiteMoji = '相手';
    if (aiteInt == 0) {
      aiteMoji = 'あなた';
    } else {
      aiteMoji = '相手';
    }

    // 生年月日から日干No.を算出する
    var nkMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(4, 5); // 日干を取り出す
    var gkMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(2, 3); // 月干を取り出す
    var ykMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(0, 1); // 年干を取り出す
    // 生年月日から日支No.を算出する
    var nsMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(5, 6); // 日支を取り出す
    var gsMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(3, 4); // 月支を取り出す
    var ysMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(1, 2); // 月支を取り出す
    var jnuMoji = juuNiUnMoji(nkMoji, nsMoji);
    var jnuMojiG = juuNiUnMoji(nkMoji, gsMoji);
    var jnuMojiY = juuNiUnMoji(nkMoji, ysMoji);
    var jnuNo = juuNiUnNo(jnuMoji);
    var jnuNoG = juuNiUnNo(jnuMojiG);
    var jnuNoY = juuNiUnNo(jnuMojiY);
    var jnuMojiA = juuNiUnMojiA(jnuMoji);
    var jnuMojiAG = juuNiUnMojiA(jnuMojiG);
    var jnuMojiAY = juuNiUnMojiA(jnuMojiY);
    var jnuYomi = juuNiUnYomi(jnuMoji);
    var jnuYomiG = juuNiUnYomi(jnuMojiG);
    var jnuYomiY = juuNiUnYomi(jnuMojiY);
    // 四旺・四平・四衰を算出する
    var siouSisui = juuNiUnSiou(jnuMoji);
    var siouSisuiG = juuNiUnSiou(jnuMojiG);
    var siouSisuiY = juuNiUnSiou(jnuMojiY);
    var siouSisuiNo = juuNiUnSiouNo(jnuMoji);
    var siouSisuiNoG = juuNiUnSiouNo(jnuMojiG);
    var siouSisuiNoY = juuNiUnSiouNo(jnuMojiY);
    var siouSisuiA = juuNiUnSiouA(jnuMoji);
    var siouSisuiAG = juuNiUnSiouA(jnuMojiG);
    var siouSisuiAY = juuNiUnSiouA(jnuMojiY);

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$seinenInt.$seigatuInt.$seinitiInt 生　$aiteMojiの十二運',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            const Text(
              '　　　　　　　日柱　　月柱　　年柱',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '運勢の特徴　　 $jnuMoji　　　$jnuMojiG　　　$jnuMojiY ',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '運勢の強さ　　$siouSisuiA　　$siouSisuiAG　　$siouSisuiAY',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Text(
              '十二運の影響　 60%　　 30%　　 10%',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Expanded(
              child: ListView(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      _togglePanel(panelIndex);
                    },
                    animationDuration: const Duration(seconds: 1),
                    children: [
                      // ToDo:■■■■■　日柱の十二運　■■■■■
                      ExpansionPanel(
                        isExpanded: _listExpanded[0],
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text(
                              '日柱の十二運',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '　日柱の十二運は、$jnuMoji（$jnuYomi）です。',
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            nsu[jnuNo], // Todo: 十二運No.を計算していれる
                            ListTile(
                              trailing: const Icon(Icons.expand_less),
                              onTap: () => _closePanel(0),
                            ),
                          ],
                        ),
                        //isExpanded: _isExpanded0,
                      ),
                      // ToDo:■■■■■　月柱の十二運　■■■■■
                      ExpansionPanel(
                        isExpanded: _listExpanded[1],
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text(
                              '月柱の十二運',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '　月柱の十二運は、$jnuMojiG（$jnuYomiG）です。',
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            nsu[jnuNoG],
                            ListTile(
                              trailing: const Icon(Icons.expand_less),
                              onTap: () => _closePanel(1),
                            ),
                          ],
                        ),
                      ),
                      // Todo:■■■■■　年柱の十二運　■■■■■
                      ExpansionPanel(
                        isExpanded: _listExpanded[2],
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text(
                              '年柱の十二運',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '　年柱の十二運は、$jnuMojiY（$jnuYomiY）です。',
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            nsu[jnuNoY],
                            ListTile(
                              trailing: const Icon(Icons.expand_less),
                              onTap: () => _closePanel(2),
                              //child: const Text('閉じる'),
                            ),
                          ],
                        ),
                        //isExpanded: _isExpanded1,
                      ),
                      // ToDo:■■■■■　運勢の強さ　■■■■■
                      ExpansionPanel(
                        isExpanded: _listExpanded[3],
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text(
                              '運勢の強さ',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '　運勢の強さは、$siouSisuiです。',
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            nss[siouSisuiNo],
                            ListTile(
                              trailing: const Icon(Icons.expand_less),
                              onTap: () => _closePanel(3),
                              //child: const Text('閉じる'),
                            ),
                          ],
                        ),
                        //isExpanded: _isExpanded1,
                      ),
                      // ToDo:■■■■■　十二運の解説　■■■■■
                      ExpansionPanel(
                        isExpanded: _listExpanded[4],
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return const ListTile(
                            title: Text(
                              '十二運の算出方法（鑑定士を目指す方へ）',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '　$aiteMojiの十二運は、$jnuMojiA（$jnuYomi）です。',
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            nsu[jnuNo],
                            ListTile(
                              trailing: const Icon(Icons.expand_less),
                              onTap: () => _closePanel(4),
                              //child: const Text('閉じる'),
                            ),
                          ],
                        ),
                        //isExpanded: _isExpanded1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
