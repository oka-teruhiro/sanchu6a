import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {


  // 鑑定ボタンの色
  List<int> color1 = [
    0xFF000000,
    0xFF000000,
    0xFF000000,
    0xFF000000,
    0xFF000000,
  ];
  List<int> color2 = [
    0xFF000000,
    0xFF000000,
    0xFF000000,
    0xFF000000,
    0xFF000000,
  ];
  String _birthday = '';
  String _birthdaya = '2000-01-01';
  String birthdayHyouji = '';
  String birthdayOld = '';
  final List<String> _birthD = ['生年月日', '生年月日', '生年月日', '生年月日', '生年月日'];
  final List<String> _birthH = [
    '1 : 生年月日 ?　 ',
    '2 : 生年月日 ?　 ',
    '3 : 生年月日 ?　 ',
    '4 : 生年月日 ?　 ',
    '5 : 生年月日 ?　 '
  ];
  final List<String> _birthO = ['生年月日', '生年月日', '生年月日', '生年月日', '生年月日'];
  final List<String> _memoH = ['私', '相手1', '相手2', '相手3', '相手4'];

  String _birthday0 = '';
  String _birthday1 = '';
  String _birthday2 = '';
  String _birthday3 = '';
  String _birthday4 = '';
  String _memo0 = '私';
  String _memo1 = '相手1';
  String _memo2 = '相手2';
  String _memo3 = '相手3';
  String _memo4 = '相手4';
  String seinengappiMojia = '';
  DateTime newDate = DateTime.now();
  DateTime date9 = DateTime(DateTime.now().year - 30);
  int item = 0;
  int seiNen = 2000;
  int seiGatu = 1;
  int seiNiti = 1;

  @override
  void initState() {
    super.initState();
    _getPrefItems();
    return;
  }

  // shareed Preference に保存されているデータを読み込んで、_counterにセットする
  _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _birthday0 = prefs.getString('birthday0') ?? '生年月日';
      _birthday1 = prefs.getString('birthday1') ?? '生年月日';
      _birthday2 = prefs.getString('birthday2') ?? '生年月日';
      _birthday3 = prefs.getString('birthday3') ?? '生年月日';
      _birthday4 = prefs.getString('birthday4') ?? '生年月日';
      _memo0 = prefs.getString('memo0') ?? '私';
      _memo1 = prefs.getString('memo1') ?? '相手1';
      _memo2 = prefs.getString('memo2') ?? '相手2';
      _memo3 = prefs.getString('memo3') ?? '相手3';
      _memo4 = prefs.getString('memo4') ?? '相手4';
    });
    _birthD.removeAt(0);
    _birthD.insert(0, _birthday0);
    _birthD.removeAt(1);
    _birthD.insert(1, _birthday1);
    _birthD.removeAt(2);
    _birthD.insert(2, _birthday2);
    _birthD.removeAt(3);
    _birthD.insert(3, _birthday3);
    _birthD.removeAt(4);
    _birthD.insert(4, _birthday4);

    _memoH.removeAt(0);
    _memoH.insert(0, _memo0);
    _memoH.removeAt(1);
    _memoH.insert(1, _memo1);
    _memoH.removeAt(2);
    _memoH.insert(2, _memo2);
    _memoH.removeAt(3);
    _memoH.insert(3, _memo3);
    _memoH.removeAt(4);
    _memoH.insert(4, _memo4);

    for (int i = 0; i < 5; i++) {
      int j = i + 1;
      _birthday = _birthD[i];
      if (_birthday == '生年月日') {
        birthdayHyouji = '$j : 生年月日 ?　 ';
        color1[i] = 0xFF000000;
        color2[i] = 0xFF000000;
      } else {
        birthdayHyouji = '$j : $_birthday 生';
        color1[i] = 0xFF1E88E5;
        color2[i] = 0xFFFFFFFF;
      }
      _birthH.removeAt(i);
      _birthH.insert(i, birthdayHyouji);
      _birthO.removeAt(i);
      _birthO.insert(i, _birthday);
    }
    setState(() {});
  }

  //データを書き込む
  _setPrefItems(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int j = item + 1;
    _birthD.removeAt(item);
    _birthD.insert(item, _birthday);
    _birthO.removeAt(item);
    _birthO.insert(item, _birthday);
    _birthH.removeAt(item);
    _birthH.insert(item, '$j : $_birthday 生');
    if (item == 0) {
      //_birthday0 = _birthday;
      prefs.setString('birthday0', _birthD[item]);
    } else if (item == 1) {
      prefs.setString('birthday1', _birthD[item]);
    } else if (item == 2) {
      prefs.setString('birthday2', _birthD[item]);
    } else if (item == 3) {
      prefs.setString('birthday3', _birthD[item]);
    } else if (item == 4) {
      prefs.setString('birthday4', _birthD[item]);
    } else {}

    setState(() {});
  }

  //データを削除する
  _removePrefItems(int item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    seinengappiMojia = '';
    int j = item + 1;
    _birthD.removeAt(item);
    _birthD.insert(item, '生年月日');
    _birthO.removeAt(item);
    _birthO.insert(item, '生年月日');
    _birthH.removeAt(item);
    _birthH.insert(item, '$j : 生年月日 ?　 ');
    if (item == 0) {
      setState(() {
        prefs.remove('birthday0');
      });
    } else if (item == 1) {
      setState(() {
        prefs.remove('birthday1');
      });
    } else if (item == 2) {
      setState(() {
        prefs.remove('birthday2');
      });
    } else if (item == 3) {
      setState(() {
        prefs.remove('birthday3');
      });
    } else if (item == 4) {
      setState(() {
        prefs.remove('birthday4');
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text('天運三柱推命 ver.6.1.17',
              style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Update(),
                    ));*/
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 4,
              ),
              Container(
                height: 44,
                width: 440,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    'このアプリの使い方を見る',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   const DougaKaisetu3(),
                      ),
                    );*/
                  },
                ),
              ),
              SizedBox(
                height: 260,
                width: 440,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.tealAccent,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 生年月日表示欄
                            SizedBox(
                                height: 44,
                                width: 160,
                                child: TextButton(
                                  child: Text(
                                    _birthH[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    _birthday = _birthD[index];
                                    if (_birthday == '生年月日') {
                                      date9 = DateTime(
                                          DateTime.now().year - 30,
                                          DateTime.now().month,
                                          DateTime.now().day);
                                    } else if (_birthday == '') {
                                      date9 = DateTime(
                                          DateTime.now().year - 30,
                                          DateTime.now().month,
                                          DateTime.now().day);
                                    } else {
                                      _birthdaya =
                                          '${_birthday.substring(0, 4)}-${_birthday.substring(5, 7)}-${_birthday.substring(8, 10)}';
                                      date9 = DateTime.parse(_birthdaya);
                                    }
                                    _showCupertinoDatePicker(context, index);
                                    setState(() {});
                                  },
                                )),

                            // メモ　欄　の表示
                            SizedBox(
                              width: 70,
                              child: TextButton(
                                child: Text(
                                  _memoH[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),

                            // 今日の運勢　ボタン
                            SizedBox(
                              height: 30,
                              width: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(color1[index]), //背景色
                                  padding: const EdgeInsets.all(4), //パディング
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                child: Text(
                                  style: TextStyle(
                                    height: -0.2,
                                    fontWeight: FontWeight.normal,
                                    color: Color(color2[index]),
                                    fontSize: 14,
                                  ),
                                  '鑑定結果',
                                ),
                                onPressed: () {
                                  //ToDo　今日の運勢画面に飛ぶ
                                  seinengappiMojia = _birthD[index];
                                  if (seinengappiMojia == '生年月日') {
                                  } else {
                                    seiNen = int.parse(
                                        seinengappiMojia.substring(0, 4));
                                    seiGatu = int.parse(
                                        seinengappiMojia.substring(5, 7));
                                    seiNiti = int.parse(
                                        seinengappiMojia.substring(8, 10));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyHomePage(
                                                  currentIndex: 1,
                                                seinenInt: seiNen,   // 6.1.2
                                                seigatuInt: seiGatu, // 6.1.2
                                                seinitiInt: seiNiti, // 6.1.2
                                                aiteInt: index,  //6.1.16
                                              )),
                                    );
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PageB(
                                          //seinenInt: seiNen,
                                          //seigatuInt: seiGatu,
                                          //seinitiInt: seiNiti,
                                        ),
                                      ),
                                    );*/
                                  }
                                },
                              ),
                            ),

                            // 性格・天地徳合　ボタン
                            /*SizedBox(
                              height: 30,
                              width: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  seinengappiMojia = _birthD[index];
                                  if (seinengappiMojia == '生年月日') {
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PageC(
                                          //titleSeinengappi: seinengappiMojia,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue, //背景色
                                  padding: const EdgeInsets.all(4), //パディング
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                child: const Text(
                                  style: TextStyle(
                                    height: -0.2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  '性格',
                                ),
                              ),
                            ),*/
                            const SizedBox(
                              width: 0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 44,
                width: 440,
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    '易占クイズに挑戦する',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    //TODO: 易占検定画面へ飛ぶ
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage001(),
                      ),
                    );*/
                  },
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/main/gogyou3.jpg')),
            ],
          ),
        ),
        /*Container(
          color: Colors.amberAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('This is PageA'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(currentIndex: 1)),
                    );
                  },
                  child: const Text('鑑定結果'),
                ),
              ],
            ),
          ),
        ),*/
      ),
    );
  }

  // 画面下からDatePickerを表示する
  void _showCupertinoDatePicker(BuildContext context, int i) {
    int j = i + 1;
    _birthday = _birthD[i];
    birthdayOld = _birthD[i];
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 280,
            child: Container(
              color: Colors.white12,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // iOS タイプのDatePickerを表示
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.black54,
                      initialDateTime: date9,
                      minimumYear: 1901,
                      maximumYear: 2199,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (newDate) {
                        _birthday = DateFormat('yyyy/MM/dd').format(newDate);
                        birthdayHyouji = '($j : $_birthday 生';
                        setState(() {});
                      },
                    ),
                  ),

                  // 「キャンセル」「削除」「登録」ボタン
                  SizedBox(
                    //color: Colors.blue,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // キャンセル　ボタン
                        TextButton(
                          child: const Text(
                            'キャンセル',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onPressed: () {
                            _birthday = birthdayOld;
                            if (_birthday == '生年月日') {
                              birthdayHyouji = '$j : 生年月日 ?';
                            } else {
                              birthdayHyouji = '$j : $_birthday 生';
                            }
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                        ),

                        // 「削除」ボタン
                        TextButton(
                            child: const Text(
                              '削除',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () async {
                              _birthday = _birthO[i];
                              if (_birthday == '生年月日') {
                              } else {
                                //var result =
                                await showDialog<int>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    // 削除のダイアログを表示
                                    return AlertDialog(
                                      backgroundColor: Colors.blue,
                                      content: Text(
                                          '$_birthday を削除しますか？',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        // 「Cancel」ボタン
                                        TextButton(
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),

                                        // 「OK」ボタン
                                        TextButton(
                                            child: const Text(
                                              '削除',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            onPressed: () {
                                              _removePrefItems(i);
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                              color1[i] = 0xFF000000;
                                              color2[i] = 0xFF000000;

                                              setState(() {});
                                            }),
                                      ],
                                    );
                                  },
                                );
                              }
                            }),

                        // 「登録」　ボタン
                        TextButton(
                            child: const Text(
                              '登録',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () async {
                              //TODO;
                              if (_birthday == '生年月日') {
                                _birthday = DateFormat('yyyy/MM/dd')
                                    .format(DateTime.now());
                              } else {}
                              //var result =
                              await showDialog<int>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  // 登録　ダイアログを表示する
                                  return AlertDialog(

                                    backgroundColor: Colors.blue,
                                    content: Text(
                                        '$_birthday で登録しますか？',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white
                                      ),
                                    ),
                                    actions: <Widget>[
                                      //「Cancel」ボタン
                                      TextButton(
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          }),

                                      // 「OK」ボタン
                                      TextButton(
                                          child: const Text(
                                            '登録',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          onPressed: () {
                                            birthdayHyouji = ' : $_birthday 生';
                                            birthdayOld = _birthday;
                                            seinengappiMojia = _birthday;
                                            color1[i] = 0xFF1E88E5;
                                            color2[i] = 0xFFFFFFFF;

                                            _setPrefItems(i);
                                            setState(() {});
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          }),
                                    ],
                                  );
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
