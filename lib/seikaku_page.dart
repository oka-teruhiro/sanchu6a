import 'package:flutter/material.dart';
import 'package:sanch6a/kansuu.dart';

import 'niti_kan.dart';

class SeikakuPage extends StatefulWidget {
  final int seinenInt;
  final int seigatuInt;
  final int seinitiInt;
  final int aiteInt;  //6.1.16

  const SeikakuPage({
    super.key,
    required this.seinenInt,
    required this.seigatuInt,
    required this.seinitiInt,
    required this.aiteInt,  //6.1.16
  });

  @override
  SeikakuPageState createState() => SeikakuPageState();
}

class SeikakuPageState extends State<SeikakuPage> {
  late int seinenInt = 2000; // 6.1.15
  late int seigatuInt = 1; //   6.1.15
  late int seinitiInt = 1; //   6.1.15
  late int aiteInt = 0;   //6.1.16
  final _listExpanded = [true, false, false];

  void _togglePanel(int index) {
    setState(() {
      //for (int i = 0; i < _listExpanded.length; i++ ) {
      //  _listExpanded[i] = i == index ? !_listExpanded[i] : false;
      if (index == 0) {
        _listExpanded[0] = !_listExpanded[0];
      } else if (index == 1) {
        _listExpanded[1] = !_listExpanded[1];
      } else {
        _listExpanded[2] = !_listExpanded[2];
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

    List<Widget> nks = [  // 日干からみた性質リスト
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
    ];
    String aiteMoji = '相手';

    if (aiteInt == 0) {
      aiteMoji = 'あなた';
    } else {
      aiteMoji = '相手';
    }

    // 生年月日から日干No.を算出する
    var nkMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(4, 5);
    var nk = juKanNo(nkMoji);
    var nkYomi = juKanYomi(nkMoji);

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$seinenInt.$seigatuInt.$seinitiInt 生　$aiteMojiの性格',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                _togglePanel(panelIndex);
              },
              animationDuration: const Duration(seconds: 1),
              children: [
                ExpansionPanel(
                  isExpanded: _listExpanded[0],
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text(
                        '日干からみた性格',
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
                          '　$aiteMojiの日干は、$nkMoji（$nkYomi）です。',
                          style: const TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ),
                      nks[nk], // Todo: 日干No.を計算していれる
                      ListTile(
                        trailing: const Icon(Icons.expand_less),
                        onTap: () => _closePanel(0),
                      ),
                    ],
                  ),
                  //isExpanded: _isExpanded0,
                ),
                ExpansionPanel(
                  isExpanded: _listExpanded[1],
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text(
                        '日支からみた運勢',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  body: Column(
                    children: <Widget>[
                      nks[8],
                      ListTile(
                        trailing: const Icon(Icons.expand_less),
                        onTap: () => _closePanel(1),
                      ),
                    ],
                  ),
                ),
                ExpansionPanel(
                  isExpanded: _listExpanded[2],
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text(
                        '日支からみた運勢詳細',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  body: Column(
                    children: <Widget>[
                      nks[9],
                      ListTile(
                        trailing: const Icon(Icons.expand_less),

                        onTap: () => _closePanel(2),
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
    );
  }
}
