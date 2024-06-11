import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'page_a.dart';
import 'page_b.dart';
import 'page_c.dart';
import 'page_d.dart';
import 'page_e.dart';
import 'page_f.dart';
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
          //primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int currentIndex;

  const MyHomePage({super.key, this.currentIndex = 0}); // currentIndexを追加

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  final List<Widget> _children = [
    const PageA(),
    const PageB(),
    const PageC(),
    const PageD(),
    const PageE(),
    const PageF(),
    const PageG(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: _currentIndex == 0
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white24,
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
                  label: '今日の運勢',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '性格',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.upload),
                  label: '天運の年',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart),
                  label: '命式表',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart),
                  label: 'チャート',
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
