import 'package:flutter/material.dart';

class SeikakuPage extends StatefulWidget {
  final int seinenInt;
  final int seigatuInt;
  final int seinitiInt;
  const SeikakuPage({
    super.key,
    required this.seinenInt,
    required this.seigatuInt,
    required this.seinitiInt,
  });

  @override
  _SeikakuPageState createState() => _SeikakuPageState();
}

class _SeikakuPageState extends State<SeikakuPage> {
  late int seinenInt = 2000; // 6.1.15
  late int seigatuInt = 1; //   6.1.15
  late int seinitiInt = 1; //   6.1.15
  /*bool _isExpanded0 = true; // タイル0の開閉状態
  bool _isExpanded1 = false; // タイル1の開閉状態
  bool _isExpanded2 = false; // タイル1の開閉状態

  // ExpansionPanelの開閉状態を管理するメソッド
  void _togglePanel(int panelIndex) {
    setState(() {
      if (panelIndex == 0) {
        _isExpanded0 = !_isExpanded0;
      } else if (panelIndex == 1) {
        _isExpanded1 = !_isExpanded1;
      } else if (panelIndex == 2) {
        _isExpanded2 = !_isExpanded2;
      }
    });
  }*/
  final _listExpanded = [true, false,false];

  void _togglePanel(int index) {
    setState(() {
      //for (int i = 0; i < _listExpanded.length; i++ ) {
      //  _listExpanded[i] = i == index ? !_listExpanded[i] : false;
      if (index == 0) {
        _listExpanded[0] = !_listExpanded[0];
      }else if (index == 1) {
        _listExpanded[1] = !_listExpanded[1];
      }else{
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
    seinenInt = widget.seinenInt;   // 6.1.15
    seigatuInt = widget.seigatuInt; // 6.1.15
    seinitiInt = widget.seinitiInt; // 6.1.15

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$seinenInt.$seigatuInt.$seinitiInt 生　の性格',
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
                      title: Text('日干からみた性格',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.normal,
                          ),
                      ),
                    );
                  },
                  body: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      ListTile(
                        trailing: const Icon(Icons.expand_less),

                        onTap: () => _closePanel(0),
                        //child: const Text('閉じる'),

                      ),
                    ],
                  ),
                  //isExpanded: _isExpanded0,
                ),
                ExpansionPanel(
                  isExpanded: _listExpanded[1],
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('日支からみた運勢',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.normal,
                        ),),
                    );
                  },
                  body: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      ListTile(
                        trailing: const Icon(Icons.expand_less),

                        onTap: () => _closePanel(1),
                        //child: const Text('閉じる'),

                      ),
                    ],
                  ),
                  //isExpanded: _isExpanded1,
                ),
                ExpansionPanel(
                  isExpanded: _listExpanded[2],
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return const ListTile(
                      title: Text('日支からみた運勢詳細',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.normal,
                        ),),
                    );
                  },
                  body: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　日干が甲の人は、樹木にたとえられる性質を持っています。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          '　樹木は天に向かって伸びるように、向上心にあふれ、新しいことをしようと'
                              'する気持ちが強く、現在おかれている境遇よりもさらに成長しようと努'
                              '力します。',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
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
