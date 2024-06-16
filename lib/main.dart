import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sanch6a/meisiki_page.dart';
import '../meisiki_chart_page.dart';
import 'kyou_unsei_page.dart';
import 'page_a.dart';
import 'page_c.dart';
import 'page_d.dart';
import 'page_g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // DatePickerを日本語化する
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      locale: const Locale('ja', 'JP'),
      // 日本語化ここまで
      title: '天運三柱推命',
      theme: ThemeData.dark(
          ),
      home: const MyHomePage(
        seinenInt: 2000, // 6.1.2
        seigatuInt: 1,   // 6.1.2
        seinitiInt: 1,   // 6.1.2
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int currentIndex;
  final int seinenInt;  // 6.1.2
  final int seigatuInt; // 6.1.2
  final int seinitiInt; // 6.1.2

  const MyHomePage({
    super.key,
    this.currentIndex = 0,
    required this.seinenInt,  // 6.1.2
    required this.seigatuInt, // 6.1.2
    required this.seinitiInt, // 6.1.2
  }); // currentIndexを追加

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late int _currentIndex;
  late int _seinenInt;     // 6.1.2
  late int _seigatuInt;    // 6.1.2
  late int _seinitiInt;    // 6.1.2

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _seinenInt = widget.seinenInt;  // 6.1.2
    _seigatuInt = widget.seigatuInt; // 6.1.2
    _seinitiInt =widget.seinitiInt;  // 6.1.2
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const PageA(),
      KyouUnseiPage(
        seinenInt: _seinenInt,   // 6.1.2
        seigatuInt: _seigatuInt, // 6.1.2
        seinitiInt: _seinitiInt, // 6.1.2
      ),
      const PageC(),
      const PageD(),
      MeisikiPage(                    // 6.1.9
          seinen: _seinenInt,         // 6.1.9
          seigatu: _seigatuInt,       // 6.1.9
          seiniti: _seinitiInt,       // 6.1.9
      ),      // 6.1.9
      MeisikiChartPage(          // 6.1.8
        seinenInt: _seinenInt,   // 6.1.8
        seigatuInt: _seigatuInt, // 6.1.8
        seinitiInt: _seinitiInt, // 6.1.8
      ),
      //const PageF(),
      const PageG(),
    ];
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: _currentIndex == 0
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black12,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.pinkAccent,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.cake),
                  label: '誕生日',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: '運勢',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '性格',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.upload),
                  label: '天運年',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart),
                  label: '命式表',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart),
                  label: 'ﾁｬｰﾄ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account),
                  label: '相性',
                ),
              ],
            ),
    );
  }
}
