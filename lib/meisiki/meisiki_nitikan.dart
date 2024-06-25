import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../kansuu.dart';
import '../niti_kan.dart';

class MeisikiNitikan extends StatelessWidget {
  final int seinenInt;
  final int seigatuInt;
  final int seinitiInt;
  final int aiteInt;
  const MeisikiNitikan({
    super.key,
    required this.seinenInt,
    required this.seigatuInt,
    required this.seinitiInt,
    required this.aiteInt,
  });


  @override
  Widget build(BuildContext context) {

    String aiteMoji = '相手';
    if (aiteInt == 0) {
      aiteMoji = 'あなた';
    } else {
      aiteMoji = '相手';
    }

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

    // 生年月日から日干No.を算出する
    var nkMoji = meisikiA(seinenInt, seigatuInt, seinitiInt).substring(4, 5);
    var nk = juKanNo(nkMoji);
    var nkYomi = juKanYomi(nkMoji);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$seinenInt.$seigatuInt.$seinitiInt 生　$aiteMojiの日干からみた性格',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
         // ExpansionPanelList(
            /*expansionCallback: (int panelIndex, bool isExpanded) {
              //_togglePanel(panelIndex);
            },*/
            //animationDuration: const Duration(seconds: 1),
           // children: [
           //   ExpansionPanel(
                //isExpanded: _listExpanded[0],
               // isExpanded: true,
                /*headerBuilder: (BuildContext context, bool isExpanded) {
                  return const ListTile(
                    title: Text(
                      '日干からみた性格',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                },*/
                Column(
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
                    const ListTile(
                      title: Text(''),
                    ),
                    ListTile(
                      title: ElevatedButton(
                        child: const Text(
                          '戻る',
                          style: TextStyle(
                            color: Colors.greenAccent,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const ListTile(
                      title: Text(''),
                    ),
                  ],
                ),
                //isExpanded: _isExpanded0,
             // ),//todo
           // ],//todo
         // ),//todo
        ],
      ),

    );
  }
}
