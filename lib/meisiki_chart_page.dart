import 'dart:math';

import 'package:flutter/material.dart';

import 'kansuu.dart';

class MeisikiChartPage extends StatefulWidget {
  final int seinenInt;
  final int seigatuInt;
  final int seinitiInt;
  const MeisikiChartPage({
    super.key,
    required this.seinenInt,
    required this.seigatuInt,
    required this.seinitiInt,
  });

  @override
  State<MeisikiChartPage> createState() => _MeisikiChartPageState();
}

class _MeisikiChartPageState extends State<MeisikiChartPage> {
  int counter = 0;
  int counterY = 0; // 鑑定年カウンタ
  int counterM = 0; // 鑑定年カウンタ
  int counterD = 0; // 鑑定日カウンタ
  int counterBY = 0; // 生年カウンタ
  int counterBM = 0; // 生定年カウンタ
  int counterBD = 0; // 生定日カウンタ

  int j = 0; // 受け渡したい変数を定義
  int seinenIntS = 1990;
  int seigeIntS = 1;
  int seinitiIntS = 1;
  String nichuS = '甲子';
  String gechuS = '甲子';
  String nenchuS = '甲子';
  String tuNenKanS = '比肩';
  String tuNenSiS = '比肩';
  String tuGeKanS = '比肩';
  String tuGeSiS = '比肩';
  String tuNitiKanS = '比肩';
  String tuNitiSiS = '比肩';

  // statefullWidget に変更するため追加
  int _counter = 0;
  double setuiriButtonWidth = 0;
  int zenGo = 2; //0:節入り時刻後　1:節入り時刻前 2:節入り日以外
  List<int> iroBotan = [-14575885, -12627531, -14575885];
  List<int> iroTitle = [-1294214, -5767189, -1294214];
  List<String> botanMoji = ['節入り時刻前', '節入り時刻後', '節入り時刻前'];
  List<String> meisikiTitle = ['節入り時刻後のチャート', '節入り時刻前のチャート', '命式チャート'];
  List<int> nenchuNo = [1, 0, 1];
  List<int> gechuNo = [1, 0, 1];
  int nenchuNoH = 0;
  int gechuNoH = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      zenGo = _counter % 2;
    });
  }
  // statefullWidget に追加するために追加　ここまで

  void dateUp() {
    setState(() {
      counterD++;
    });
  }

  void dateDown() {
    setState(() {
      counterD--;
    });
  }

  void monthUp() {
    setState(() {
      counterM++;
    });
  }

  void monthDown() {
    setState(() {
      counterM--;
    });
  }

  void yearUp() {
    setState(() {
      counterY++;
    });
  }

  void yearDown() {
    setState(() {
      counterY--;
    });
  }

  void dateBUp() {
    setState(() {
      counterBD++;
    });
  }

  void dateBDown() {
    setState(() {
      counterBD--;
    });
  }

  void monthBUp() {
    setState(() {
      counterBM++;
    });
  }

  void monthBDown() {
    setState(() {
      counterBM--;
    });
  }

  void yearBUp() {
    setState(() {
      counterBY++;
    });
  }

  void yearBDown() {
    setState(() {
      counterBY--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 命式ページから受け取った変数でこのウィジェットで使える変数
    seinenIntS = widget.seinenInt; // 生年
    seigeIntS = widget.seigatuInt; // 生月
    seinitiIntS = widget.seinitiInt; // 生日

    // このウィジェットで使う変数
    DateTime nowDate = DateTime.now();
    int nowY = nowDate.year; // 今日の年
    int nowM = nowDate.month; // 今日の月
    int nowD = nowDate.day; // 今日の日

    String niKan = '甲'; // 日干
    String niSi = '子'; // 日支
    String geKan = '甲'; // 月干
    String geSi = '子'; // 月支
    String nenKan = '甲'; // 年干
    String nenSi = '子'; // 年支
    int niKanNo = 0; // 日干No.
    int niSiNo = 0; // 日支No.
    int geKanNo = 0; // 月干No.
    int geSiNo = 0; // 月支No.
    int neKanNo = 0; // 年干No.
    int neSiNo = 0; // 年子No.
    String niKG = '木'; // 日干の五行
    String niSG = '木'; // 日支の五行
    String geKG = '木'; // 月干の五行
    String geSG = '木'; // 月支の五行
    String neKG = '木'; // 年干の五行
    String neSG = '木'; // 年支の五行
    String tuG = '比食財官印比食財官印比食財官';
    String tu = '比肩劫敗食神傷官偏財正財偏官正官倒食印綬比肩劫敗食神傷官偏財正財'
        '偏官正官倒食印綬比肩劫敗食神傷官偏財正財偏官正官倒食印綬';
    //           '甲乙丙丁戊己庚辛壬癸'
    String kag = '木木火火土土金金水水';
    //           '子丑寅卯辰巳午未申酉戌亥'
    String sig = '水土木木土火火土金金土水';
    int tuSS0 = 1; // 比肩の数
    int tuSS1 = 0; // 劫敗の数
    int tuSS2 = 0; // 食神の数
    int tuSS3 = 0; // 傷官の数
    int tuSS4 = 0; // 偏財の数
    int tuSS5 = 0; // 正財の数
    int tuSS6 = 0; // 偏官の数
    int tuSS7 = 0; // 正官の数
    int tuSS8 = 0; // 倒食の数
    int tuSS9 = 0; // 印綬の数
    String tuSSM0 = '1'; // 比肩の数を文字化
    String tuSSM1 = '0'; // 劫敗の数を文字化
    String tuSSM2 = '0'; // 食神の数を文字化
    String tuSSM3 = '0'; // 傷官の数を文字化
    String tuSSM4 = '0'; // 偏財の数を文字化
    String tuSSM5 = '0'; // 正財の数を文字化
    String tuSSM6 = '0'; // 偏官の数を文字化
    String tuSSM7 = '0'; // 正官の数を文字化
    String tuSSM8 = '0'; // 倒食の数を文字化
    String tuSSM9 = '0'; // 印綬の数を文字化
    String tuSSM = '012345678901234567890';
    int setuirinitisuu = 0;

    String nenkan = '甲';
    String nensi = '子';
    String gatukan = '甲';
    String gatusi = '子';
    String nitikan = '甲';
    String nitisi = '子';
    int nenKanNo = 0;
    int gatuKanNo = 0;
    int nitiKanNo = 0;
    String zouKanNen = '甲';
    String zouKanTuki = '甲';
    String zouKanNiti = '甲';
    int zouKanNenNo = 0;
    int zouKanGatuNo = 0;
    int zouKanNitiNo = 0;
    //String rokujukkansi = //60干支
    "甲子乙丑丙寅丁卯戊辰己巳庚午辛未壬申癸酉"
        "甲戌乙亥丙子丁丑戊寅己卯庚辰辛巳壬午癸未"
        "甲申乙酉丙戌丁亥戊子己丑庚寅辛卯壬辰癸巳"
        "甲午乙未丙申丁酉戊戌己亥庚子辛丑壬寅癸卯"
        "甲辰乙巳丙午丁未戊申己酉庚戌辛亥壬子癸丑"
        "甲寅乙卯丙辰丁巳戊午己未庚申辛酉壬戌癸亥"; //
    String tuuhenbosi = //通変星
        "比肩劫敗食神傷官偏財正財偏官正官倒食印綬" //甲
        "劫敗比肩傷官食神正財偏財正官偏官印綬倒食" //乙
        "倒食印綬比肩劫敗食神傷官偏財正財偏官正官" //丙
        "印綬倒食劫敗比肩傷官食神正財偏財正官偏官" //丁
        "偏官正官倒食印綬比肩劫敗食神傷官偏財正財" //戊
        "正官偏官印綬倒食劫敗比肩傷官食神正財偏財" //己
        "偏財正財偏官正官倒食印綬比肩劫敗食神傷官" //庚
        "正財偏財正官偏官印綬倒食劫敗比肩傷官食神" //辛
        "食神傷官偏財正財偏官正官倒食印綬比肩劫敗" //壬
        "傷官食神正財偏財正官偏官印綬倒食劫敗比肩"; //癸

    //以下画像生成のための変数
    const double h1 = 25;
    const double f1 = 16;
    const double f2 = 20;
    const double x1 = 10;
    const double y1 = 20;
    const double x2 = -84;
    const double y2 = 214;

    const int c1 = -200000000; //暗い緑
    const int c2 = -1; // 白
    const int c3 = -1407770; // ピンク
    // 天が与える運勢
    int godU0 = 0; // 木地下１階
    int godU1 = 0; // 火地下１階
    int godU2 = 0; // 土地下１階
    int godU3 = 0; // 金地下１階
    int godU4 = 0; // 水地下１階
    // 通変星の数の表示内容
    int tuS0 = 0; // 木２階数
    int tuS1 = 0; // 木１階数
    int tuS2 = 0; // 火２階数
    int tuS3 = 0; // 火１階数
    int tuS4 = 0; // 土２階数
    int tuS5 = 0; // 土１階数
    int tuS6 = 0; // 金２階数
    int tuS7 = 0; // 金１階数
    int tuS8 = 0; // 水２階数
    int tuS9 = 0; // 水１階数
    // 本体五行の数
    int hoG0 = 0; // 本体木数
    int hoG1 = 0; // 本体火数
    int hoG2 = 0; // 本体土数
    int hoG3 = 0; // 本体金数
    int hoG4 = 0; // 本体水数
    // 本体五行の数の色
    int hoGColor0 = c2; // 本体木数の色
    int hoGColor1 = c2; // 本体火数の色
    int hoGColor2 = c2; // 本体土数の色
    int hoGColor3 = c2; // 本体金数の色
    int hoGColor4 = c2; // 本体水数の色
    // 天が与える運勢の数の表示色
    int godUColor0 = c2; // 木地下１階色
    int godUColor1 = c2; // 火地下1階色
    int godUColor2 = c2; // 土地下1階色
    int godUColor3 = c2; // 金地下1階色
    int godUColor4 = c2; // 水地下1階色
    // 天が与える運勢の数の表示色
    const int tuGColor0 = c2; // 木3階色
    const int tuGColor1 = c2; // 火3階色
    const int tuGColor2 = c2; // 土3階色
    const int tuGColor3 = c2; // 金3階色
    const int tuGColor4 = c2; // 水3階色
    // 通変星の数の表示色
    int tuColor0 = c2; // 木２階色
    int tuColor1 = c2; // 木１階色
    int tuColor2 = c2; // 火２階色
    int tuColor3 = c2; // 火１階色
    int tuColor4 = c2; // 土２階色
    int tuColor5 = c2; // 土１階色
    int tuColor6 = c2; // 金２階色
    int tuColor7 = c2; // 金１階色
    int tuColor8 = c2; // 水２階色
    int tuColor9 = c2; // 水１階色
    // 通変星の数の表示色
    int tuSColor0 = c2; // 木２階数色
    int tuSColor1 = c2; // 木１階数色
    int tuSColor2 = c2; // 火２階数色
    int tuSColor3 = c2; // 火１階数色
    int tuSColor4 = c2; // 土２階数色
    int tuSColor5 = c2; // 土１階数色
    int tuSColor6 = c2; // 金２階数色
    int tuSColor7 = c2; // 金１階数色
    int tuSColor8 = c2; // 水２階数色
    int tuSColor9 = c2; // 水１階数色

    // 生年月日にカウンターの値を加える
    // 今日の命式を算出する
    int birthYH = seinenIntS + counterBY;
    int birthMH = seigeIntS + counterBM;
    int birthDH = seinitiIntS + counterBD;
    DateTime birthH = DateTime(birthYH, birthMH, birthDH);

    DateTime datemin = DateTime(1901, 1, 1);
    DateTime datemax = DateTime(2199, 12, 31);
    if (birthH.isAfter(datemax)) {
      birthH = datemax;
      counterBY--;
      counterBM--;
      counterBD--;
    } else if (birthH.isBefore(datemin)) {
      birthH = datemin;
      counterBY++;
      counterBM++;
      counterBD++;
    } else {}
    int birthYH1 = birthH.year;
    int birthMH1 = birthH.month;
    int birthDH1 = birthH.day;

    // 関数meisikiAで、命式・節入り年月日時分・節入り日からの日数を算出する
    String x = meisikiA(birthYH1, birthMH1, birthDH1);
    // 節入り日からの日数を算出する
    setuirinitisuu = int.parse(x.substring(19, 21)); // 節入り日からの日数

    // 日干を算出する
    niKan = x.substring(4, 5); // 日干の文字
    niKanNo = juKanNo(niKan); // 日干No.
    j = niKanNo ~/ 2; // 比肩方向

    nichuS = x.substring(4, 6);

    if (setuirinitisuu == 1) {
      setuiriButtonWidth = 90;
    } else {
      setuiriButtonWidth = 0;
    }
    if (zenGo == 1) {
      nenchuS = x.substring(21, 23);
      gechuS = x.substring(23, 25);
    } else {
      nenchuS = x.substring(0, 2);
      gechuS = x.substring(2, 4);
    }

    //年柱・月柱・日柱から年干・年支・月干・月支・日干・日支を作成する
    nenkan = nenchuS.substring(0, 1);
    nensi = nenchuS.substring(1, 2);
    gatukan = gechuS.substring(0, 1);
    gatusi = gechuS.substring(1, 2);
    nitikan = nichuS.substring(0, 1);
    nitisi = nichuS.substring(1, 2);
    //蔵干を算出する
    zouKanNen = zouKan(nensi, setuirinitisuu);
    zouKanTuki = zouKan(gatusi, setuirinitisuu);
    zouKanNiti = zouKan(nitisi, setuirinitisuu);
    //通変星を算出する
    nitiKanNo = juKanNo(nitikan);
    gatuKanNo = juKanNo(gatukan);
    nenKanNo = juKanNo(nenkan);
    zouKanNitiNo = juKanNo(zouKanNiti);
    zouKanGatuNo = juKanNo(zouKanTuki);
    zouKanNenNo = juKanNo(zouKanNen);
    tuGeKanS = tuuhenbosi.substring(
        nitiKanNo * 20 + gatuKanNo * 2, nitiKanNo * 20 + gatuKanNo * 2 + 2);
    tuNenKanS = tuuhenbosi.substring(
        nitiKanNo * 20 + nenKanNo * 2, nitiKanNo * 20 + nenKanNo * 2 + 2);
    tuNitiSiS = tuuhenbosi.substring(nitiKanNo * 20 + zouKanNitiNo * 2,
        nitiKanNo * 20 + zouKanNitiNo * 2 + 2);
    tuGeSiS = tuuhenbosi.substring(nitiKanNo * 20 + zouKanGatuNo * 2,
        nitiKanNo * 20 + zouKanGatuNo * 2 + 2);
    tuNenSiS = tuuhenbosi.substring(
        nitiKanNo * 20 + zouKanNenNo * 2, nitiKanNo * 20 + zouKanNenNo * 2 + 2);

    // 五行を算出
    niKG = kag.substring(niKanNo, niKanNo + 1); // 日干の五行を算出
    geKan = gechuS.substring(0, 1); // 月柱から月干を取り出す
    geKanNo = juKanNo(geKan); // 月干No.を算出する
    geKG = kag.substring(geKanNo, geKanNo + 1); // 月干の五行を算出
    nenKan = nenchuS.substring(0, 1); // 月柱から月干を取り出す
    neKanNo = juKanNo(nenKan); // 月干No.を算出する
    neKG = kag.substring(neKanNo, neKanNo + 1); // 月干の五行を算出
    niSi = nichuS.substring(1, 2); // 日柱から日支を取り出す
    niSiNo = juuniSiNo(niSi); // 日支No.を算出する
    niSG = sig.substring(niSiNo, niSiNo + 1); // 日支の五行を算出
    geSi = gechuS.substring(1, 2); // 月柱から月支を取り出す
    geSiNo = juuniSiNo(geSi); // 月支No.を算出する
    geSG = sig.substring(geSiNo, geSiNo + 1); // 月支の五行を算出
    nenSi = nenchuS.substring(1, 2); // 年柱から年支を取り出す
    neSiNo = juuniSiNo(nenSi); // 年支No.を算出する
    neSG = sig.substring(neSiNo, neSiNo + 1); // 年支の五行を算出

    // 五行の数を数える
    if (niKG == '木') {
      hoG0++;
    } else if (niKG == '火') {
      hoG1++;
    } else if (niKG == '土') {
      hoG2++;
    } else if (niKG == '金') {
      hoG3++;
    } else if (niKG == '水') {
      hoG4++;
    } else {}
    if (niSG == '木') {
      hoG0++;
    } else if (niSG == '火') {
      hoG1++;
    } else if (niSG == '土') {
      hoG2++;
    } else if (niSG == '金') {
      hoG3++;
    } else if (niSG == '水') {
      hoG4++;
    } else {}
    if (geKG == '木') {
      hoG0++;
    } else if (geKG == '火') {
      hoG1++;
    } else if (geKG == '土') {
      hoG2++;
    } else if (geKG == '金') {
      hoG3++;
    } else if (geKG == '水') {
      hoG4++;
    } else {}
    if (geSG == '木') {
      hoG0++;
    } else if (geSG == '火') {
      hoG1++;
    } else if (geSG == '土') {
      hoG2++;
    } else if (geSG == '金') {
      hoG3++;
    } else if (geSG == '水') {
      hoG4++;
    } else {}
    if (neKG == '木') {
      hoG0++;
    } else if (neKG == '火') {
      hoG1++;
    } else if (neKG == '土') {
      hoG2++;
    } else if (neKG == '金') {
      hoG3++;
    } else if (neKG == '水') {
      hoG4++;
    } else {}
    if (neSG == '木') {
      hoG0++;
    } else if (neSG == '火') {
      hoG1++;
    } else if (neSG == '土') {
      hoG2++;
    } else if (neSG == '金') {
      hoG3++;
    } else if (neSG == '水') {
      hoG4++;
    } else {}

    // 本体の天の運勢の五行の数を算出する
    // 今日の命式を算出する
    int nowYH = nowY + counterY;
    int nowMH = nowM + counterM;
    int nowDH = nowD + counterD;
    DateTime nowH = DateTime(nowYH, nowMH, nowDH);

    if (nowH.isAfter(datemax)) {
      nowH = datemax;
      counterY--;
      counterM--;
      counterD--;
    } else if (nowH.isBefore(datemin)) {
      nowH = datemin;
      counterY++;
      counterM++;
      counterD++;
    } else {}
    int nowYH1 = nowH.year;
    int nowMH1 = nowH.month;
    int nowDH1 = nowH.day;
    String nowMeisiki = (meisikiA(nowYH1, nowMH1, nowDH1)).substring(0, 6);
    String nowMY = nowMeisiki.substring(0, 1);
    String godNen = kag.substring(juKanNo(nowMY), juKanNo(nowMY) + 1);
    String nowMM = nowMeisiki.substring(2, 3);
    String godGe = kag.substring(juKanNo(nowMM), juKanNo(nowMM) + 1);
    String nowMD = nowMeisiki.substring(4, 5);
    String godNi = kag.substring(juKanNo(nowMD), juKanNo(nowMD) + 1);
    if (godNen == '木') {
      godU0++;
    } else if (godNen == '火') {
      godU1++;
    } else if (godNen == '土') {
      godU2++;
    } else if (godNen == '金') {
      godU3++;
    } else if (godNen == '水') {
      godU4++;
    } else {}
    if (godGe == '木') {
      godU0++;
    } else if (godGe == '火') {
      godU1++;
    } else if (godGe == '土') {
      godU2++;
    } else if (godGe == '金') {
      godU3++;
    } else if (godGe == '水') {
      godU4++;
    } else {}
    if (godNi == '木') {
      godU0++;
    } else if (godNi == '火') {
      godU1++;
    } else if (godNi == '土') {
      godU2++;
    } else if (godNi == '金') {
      godU3++;
    } else if (godNi == '水') {
      godU4++;
    } else {}

    // 本体五行の数が０のとき、色を薄くする
    if (hoG0 == 0) {
      hoGColor0 = c1;
    } else {
      hoGColor0 = c2;
    }
    if (hoG1 == 0) {
      hoGColor1 = c1;
    } else {
      hoGColor1 = c2;
    }
    if (hoG2 == 0) {
      hoGColor2 = c1;
    } else {
      hoGColor2 = c2;
    }
    if (hoG3 == 0) {
      hoGColor3 = c1;
    } else {
      hoGColor3 = c2;
    }
    if (hoG4 == 0) {
      hoGColor4 = c1;
    } else {
      hoGColor4 = c2;
    }
    // 地下1階の色
    if (godU0 == 0) {
      godUColor0 = c1;
    } else {
      godUColor0 = c3;
    }
    if (godU1 == 0) {
      godUColor1 = c1;
    } else {
      godUColor1 = c3;
    }
    if (godU2 == 0) {
      godUColor2 = c1;
    } else {
      godUColor2 = c3;
    }
    if (godU3 == 0) {
      godUColor3 = c1;
    } else {
      godUColor3 = c3;
    }
    if (godU4 == 0) {
      godUColor4 = c1;
    } else {
      godUColor4 = c3;
    }

    // 表面３階を算出する
    String tuG0 = tuG.substring(5 - j, 6 - j);
    String tuG1 = tuG.substring(6 - j, 7 - j);
    String tuG2 = tuG.substring(7 - j, 8 - j);
    String tuG3 = tuG.substring(8 - j, 9 - j);
    String tuG4 = tuG.substring(9 - j, 10 - j);
    // 表面２階１階を算出する
    String tu0 = tu.substring(20 - j * 4, 22 - j * 4);
    String tu1 = tu.substring(22 - j * 4, 24 - j * 4);
    String tu2 = tu.substring(24 - j * 4, 26 - j * 4);
    String tu3 = tu.substring(26 - j * 4, 28 - j * 4);
    String tu4 = tu.substring(28 - j * 4, 30 - j * 4);
    String tu5 = tu.substring(30 - j * 4, 32 - j * 4);
    String tu6 = tu.substring(32 - j * 4, 34 - j * 4);
    String tu7 = tu.substring(34 - j * 4, 36 - j * 4);
    String tu8 = tu.substring(36 - j * 4, 38 - j * 4);
    String tu9 = tu.substring(38 - j * 4, 40 - j * 4);
    // 通変星の数を数える
    if (tuNitiSiS == '比肩') {
      tuSS0++;
    } else if (tuNitiSiS == '劫敗') {
      tuSS1++;
    } else if (tuNitiSiS == '食神') {
      tuSS2++;
    } else if (tuNitiSiS == '傷官') {
      tuSS3++;
    } else if (tuNitiSiS == '偏財') {
      tuSS4++;
    } else if (tuNitiSiS == '正財') {
      tuSS5++;
    } else if (tuNitiSiS == '偏官') {
      tuSS6++;
    } else if (tuNitiSiS == '正官') {
      tuSS7++;
    } else if (tuNitiSiS == '倒食') {
      tuSS8++;
    } else if (tuNitiSiS == '印綬') {
      tuSS9++;
    } else {}
    if (tuGeKanS == '比肩') {
      tuSS0++;
    } else if (tuGeKanS == '劫敗') {
      tuSS1++;
    } else if (tuGeKanS == '食神') {
      tuSS2++;
    } else if (tuGeKanS == '傷官') {
      tuSS3++;
    } else if (tuGeKanS == '偏財') {
      tuSS4++;
    } else if (tuGeKanS == '正財') {
      tuSS5++;
    } else if (tuGeKanS == '偏官') {
      tuSS6++;
    } else if (tuGeKanS == '正官') {
      tuSS7++;
    } else if (tuGeKanS == '倒食') {
      tuSS8++;
    } else if (tuGeKanS == '印綬') {
      tuSS9++;
    } else {}
    if (tuGeSiS == '比肩') {
      tuSS0++;
    } else if (tuGeSiS == '劫敗') {
      tuSS1++;
    } else if (tuGeSiS == '食神') {
      tuSS2++;
    } else if (tuGeSiS == '傷官') {
      tuSS3++;
    } else if (tuGeSiS == '偏財') {
      tuSS4++;
    } else if (tuGeSiS == '正財') {
      tuSS5++;
    } else if (tuGeSiS == '偏官') {
      tuSS6++;
    } else if (tuGeSiS == '正官') {
      tuSS7++;
    } else if (tuGeSiS == '倒食') {
      tuSS8++;
    } else if (tuGeSiS == '印綬') {
      tuSS9++;
    } else {}
    if (tuNenKanS == '比肩') {
      tuSS0++;
    } else if (tuNenKanS == '劫敗') {
      tuSS1++;
    } else if (tuNenKanS == '食神') {
      tuSS2++;
    } else if (tuNenKanS == '傷官') {
      tuSS3++;
    } else if (tuNenKanS == '偏財') {
      tuSS4++;
    } else if (tuNenKanS == '正財') {
      tuSS5++;
    } else if (tuNenKanS == '偏官') {
      tuSS6++;
    } else if (tuNenKanS == '正官') {
      tuSS7++;
    } else if (tuNenKanS == '倒食') {
      tuSS8++;
    } else if (tuNenKanS == '印綬') {
      tuSS9++;
    } else {}
    if (tuNenSiS == '比肩') {
      tuSS0++;
    } else if (tuNenSiS == '劫敗') {
      tuSS1++;
    } else if (tuNenSiS == '食神') {
      tuSS2++;
    } else if (tuNenSiS == '傷官') {
      tuSS3++;
    } else if (tuNenSiS == '偏財') {
      tuSS4++;
    } else if (tuNenSiS == '正財') {
      tuSS5++;
    } else if (tuNenSiS == '偏官') {
      tuSS6++;
    } else if (tuNenSiS == '正官') {
      tuSS7++;
    } else if (tuNenSiS == '倒食') {
      tuSS8++;
    } else if (tuNenSiS == '印綬') {
      tuSS9++;
    } else {}
    // 通変星の数をそれぞれの位置に配置する
    tuSSM0 = tuSS0.toString();
    tuSSM1 = tuSS1.toString();
    tuSSM2 = tuSS2.toString();
    tuSSM3 = tuSS3.toString();
    tuSSM4 = tuSS4.toString();
    tuSSM5 = tuSS5.toString();
    tuSSM6 = tuSS6.toString();
    tuSSM7 = tuSS7.toString();
    tuSSM8 = tuSS8.toString();
    tuSSM9 = tuSS9.toString();
    tuSSM = tuSSM0 +
        tuSSM1 +
        tuSSM2 +
        tuSSM3 +
        tuSSM4 +
        tuSSM5 +
        tuSSM6 +
        tuSSM7 +
        tuSSM8 +
        tuSSM9 +
        tuSSM0 +
        tuSSM1 +
        tuSSM2 +
        tuSSM3 +
        tuSSM4 +
        tuSSM5 +
        tuSSM6 +
        tuSSM7 +
        tuSSM8 +
        tuSSM9;

    tuS0 = int.parse(tuSSM.substring(10 - j * 2, 11 - j * 2));
    tuS1 = int.parse(tuSSM.substring(11 - j * 2, 12 - j * 2));
    tuS2 = int.parse(tuSSM.substring(12 - j * 2, 13 - j * 2));
    tuS3 = int.parse(tuSSM.substring(13 - j * 2, 14 - j * 2));
    tuS4 = int.parse(tuSSM.substring(14 - j * 2, 15 - j * 2));
    tuS5 = int.parse(tuSSM.substring(15 - j * 2, 16 - j * 2));
    tuS6 = int.parse(tuSSM.substring(16 - j * 2, 17 - j * 2));
    tuS7 = int.parse(tuSSM.substring(17 - j * 2, 18 - j * 2));
    tuS8 = int.parse(tuSSM.substring(18 - j * 2, 19 - j * 2));
    tuS9 = int.parse(tuSSM.substring(19 - j * 2, 20 - j * 2));
    // 通変星の数が0のところの色を暗くする
    if (tuS0 == 0) {
      tuColor0 = c1;
      tuSColor0 = c1;
    } else {}
    if (tuS1 == 0) {
      tuColor1 = c1;
      tuSColor1 = c1;
    } else {}
    if (tuS2 == 0) {
      tuColor2 = c1;
      tuSColor2 = c1;
    } else {}
    if (tuS3 == 0) {
      tuColor3 = c1;
      tuSColor3 = c1;
    } else {}
    if (tuS4 == 0) {
      tuColor4 = c1;
      tuSColor4 = c1;
    } else {}
    if (tuS5 == 0) {
      tuColor5 = c1;
      tuSColor5 = c1;
    } else {}
    if (tuS6 == 0) {
      tuColor6 = c1;
      tuSColor6 = c1;
    } else {}
    if (tuS7 == 0) {
      tuColor7 = c1;
      tuSColor7 = c1;
    } else {}
    if (tuS8 == 0) {
      tuColor8 = c1;
      tuSColor8 = c1;
    } else {}
    if (tuS9 == 0) {
      tuColor9 = c1;
      tuSColor9 = c1;
    } else {}
    // 本質の計算

    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            meisikiTitle[zenGo],
            style: TextStyle(
              color: Color(iroTitle[zenGo]),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: setuiriButtonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(iroBotan[zenGo]),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: Text(
                    botanMoji[zenGo],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                const SizedBox(
                                  width: 312,
                                  height: 490,

                                ),
                                SizedBox(
                                  width: 312,
                                  height: 460,
                                  child: CustomPaint(
                                    painter: ShapePainter1(), // 渡したい変数を引数に指定する
                                  ),
                                ),
                                SizedBox(
                                  width: 312,
                                  height: 460,
                                  child: CustomPaint(
                                    painter: ShapePainter2(
                                        gogyou: j), // 渡したい変数を引数に指定する
                                  ),
                                ),
                                // ■■■■■■■■■ここから5.0.0 追加■■■■■■■■■
                                // 見出し■■■■■■■■■■■■■■■■■■
                                Transform.translate( // 表面■■■■■■■■■
                                  offset: const Offset(0, 6),
                                  child: const Text(
                                    '表面',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(c3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 本質■■■■■■■■■
                                  offset: const Offset(0, 300),
                                  child: const Text(
                                    '本質',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(c3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 生年月日■■■■■■■■■
                                  offset: const Offset(170, 300),
                                  child: const Text(
                                    '生年月日',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(c3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 生年月日データ■■■■■■■■■
                                  offset: const Offset(179, 324),
                                  child: Text(
                                    '  $birthYH1.$birthMH1.$birthDH1',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Color(c2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 生年月日命式■■■■■■■■■
                                  offset: const Offset(178, 348),
                                  child: Text(
                                    '  $nenchuS$gechuS$nichuS',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(c2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 鑑定日■■■■■■■■■
                                  offset: const Offset(170, 378),
                                  child: const Text(
                                    '鑑定日',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(c3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 鑑定日データ■■■■■■■■■
                                  offset: const Offset(179, 402),
                                  child: Text(
                                    '  $nowYH1.$nowMH1.$nowDH1',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Color(c2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 鑑定日命式■■■■■■■■■
                                  offset: const Offset(178, 426),
                                  child:  Text(
                                    '  $nowMeisiki',
                                    //'　',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(c2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                // 通変グループ■■■■■■■■■■■■■■■■■■
                                Transform.translate( // 木3階■■■■■■■■■
                                    offset: const Offset(144, 6),
                                  child: Text(
                                      tuG0,
                                  style: const TextStyle(
                                    fontSize: f1,
                                      color: Color(tuGColor0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ),
                                Transform.translate( // 火3階■■■■■■■■■
                                  offset: const Offset(286, 106),
                                  child: Text(
                                    tuG1,
                                    style: const TextStyle(
                                      fontSize: f1,
                                      color: Color(tuGColor1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土3階■■■■■■■■■
                                  offset: const Offset(234, 267),
                                  child: Text(
                                    tuG2,
                                    style: const TextStyle(
                                      fontSize: f1,
                                      color: Color(tuGColor2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金3階■■■■■■■■■
                                  offset: const Offset(60, 267),
                                  child: Text(
                                    tuG3,
                                    style: const TextStyle(
                                      fontSize: f1,
                                      color: Color(tuGColor3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水3階■■■■■■■■■
                                  offset: const Offset(8, 106),
                                  child: Text(
                                    tuG4,
                                    style: const TextStyle(
                                      fontSize: f1,
                                      color: Color(tuGColor4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // 通変星■■■■■■■■■■■■■■■■■■
                                Transform.translate( // 木2階■■■■■■■■■
                                  offset: const Offset(138, 35),
                                  child: Text(
                                    tu0,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor0),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 木1階■■■■■■■■■
                                  offset: const Offset(138, 85),
                                  child: Text(
                                    tu1,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor1),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火2階■■■■■■■■■
                                  offset: const Offset(238, 109),
                                  child: Text(
                                    tu2,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火1階■■■■■■■■■
                                  offset: const Offset(190, 124),
                                  child: Text(
                                    tu3,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土2階■■■■■■■■■
                                  offset: const Offset(200, 226),
                                  child: Text(
                                    tu4,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor4),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土1階■■■■■■■■■
                                  offset: const Offset(170, 186),
                                  child: Text(
                                    tu5,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor5),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金2階■■■■■■■■■
                                  offset: const Offset(76, 226),
                                  child: Text(
                                    tu6,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor6),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金1階■■■■■■■■■
                                  offset: const Offset(106, 186),
                                  child: Text(
                                    tu7,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor7),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水2階■■■■■■■■■
                                  offset: const Offset(38, 109),
                                  child: Text(
                                    tu8,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor8),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水1階■■■■■■■■■
                                  offset: const Offset(86, 124),
                                  child: Text(
                                    tu9,
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(tuColor9),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                // 通変星の数■■■■■■■■■■■■■■■■■■
                                Transform.translate( // 木2階数■■■■■■■■■
                                  offset: const Offset(138 + x1, 35 + y1 ),
                                  child: Text(
                                    '$tuS0',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 木1階数■■■■■■■■■
                                  offset: const Offset(138 + x1, 85 + y1 ),
                                  child: Text(
                                    '$tuS1',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor1),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火2階数■■■■■■■■■
                                  offset: const Offset(238 + x1, 109 + y1 ),
                                  child: Text(
                                    '$tuS2',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor2),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火1階数■■■■■■■■■
                                  offset: const Offset(190 + x1, 124 + y1 ),
                                  child: Text(
                                    '$tuS3',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor3),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土2階数■■■■■■■■■
                                  offset: const Offset(200 + x1, 226 + y1 ),
                                  child: Text(
                                    '$tuS4',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor4),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土1階数■■■■■■■■■
                                  offset: const Offset(170 + x1, 186 + y1 ),
                                  child: Text(
                                    '$tuS5',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor5),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金2階数■■■■■■■■■
                                  offset: const Offset(76 + x1, 226 + y1 ),
                                  child: Text(
                                    '$tuS6',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor6),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金1階水■■■■■■■■■
                                  offset: const Offset(106 + x1, 186 + y1 ),
                                  child: Text(
                                    '$tuS7',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor7),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水2階水■■■■■■■■■
                                  offset: const Offset(38 + x1, 109 + y1 ),
                                  child: Text(
                                    '$tuS8',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor8),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水1階水■■■■■■■■■
                                  offset: const Offset(86 + x1, 124 + y1 ),
                                  child: Text(
                                    '$tuS9',
                                    style: TextStyle(
                                      fontSize: f2,
                                      color: Color(tuSColor9),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                // 天運■■■■■■■■■■■■■■■■
                                Transform.translate( // 木地下■■■■■■■■■
                                  offset: const Offset(148,132),
                                  child: Text(
                                    '$godU0',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火地下■■■■■■■■■
                                  offset: const Offset(166, 144),
                                  child: Text(
                                    '$godU1',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土地下■■■■■■■■■
                                  offset: const Offset(160, 168),
                                  child: Text(
                                    '$godU2',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金地下■■■■■■■■■
                                  offset: const Offset(138, 168),
                                  child: Text(
                                    '$godU3',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水地下■■■■■■■■■
                                  offset: const Offset(132, 144),
                                  child: Text(
                                    '$godU4',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // 天運本質■■■■■■■■■■■■■■■■
                                Transform.translate( // 木地下本質■■■■■■■■■
                                  offset: const Offset(148 + x2,132 + y2),
                                  child: Text(
                                    '$godU0',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火地下本質■■■■■■■■■
                                  offset: const Offset(166 + x2, 144 + y2),
                                  child: Text(
                                    '$godU1',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土地下本質■■■■■■■■■
                                  offset: const Offset(160 + x2, 168 + y2),
                                  child: Text(
                                    '$godU2',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金地下本質■■■■■■■■■
                                  offset: const Offset(138 + x2, 168 + y2),
                                  child: Text(
                                    '$godU3',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水地下本質■■■■■■■■■
                                  offset: const Offset(132 + x2, 144 + y2),
                                  child: Text(
                                    '$godU4',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(godUColor4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // 本質1階■■■■■■■■■■■■■■■■
                                Transform.translate( // 木本質1階■■■■■■■■■
                                  offset: const Offset(148 + x2,110 + y2),
                                  child: Text(
                                    '$hoG0',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(hoGColor0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火本質1階■■■■■■■■■
                                  offset: const Offset(188 + x2, 136 + y2),
                                  child: Text(
                                    '$hoG1',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(hoGColor1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土本質1階■■■■■■■■■
                                  offset: const Offset(172 + x2, 186 + y2),
                                  child: Text(
                                    '$hoG2',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(hoGColor2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金本質1階■■■■■■■■■
                                  offset: const Offset(126 + x2, 186 + y2),
                                  child: Text(
                                    '$hoG3',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(hoGColor3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水本質1階■■■■■■■■■
                                  offset: const Offset(112 + x2, 136 + y2),
                                  child: Text(
                                    '$hoG4',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Color(hoGColor4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // 本質2階■■■■■■■■■■■■■■■■
                                Transform.translate( // 木2階■■■■■■■■■
                                  offset: const Offset(148 + x2,84 + y2),
                                  child: const Text(
                                    '木',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 火2階■■■■■■■■■
                                  offset: const Offset(212 + x2, 128 + y2),
                                  child: const Text(
                                    '火',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 土2階■■■■■■■■■
                                  offset: const Offset(184 + x2, 206 + y2),
                                  child: const Text(
                                    '土',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 金2階■■■■■■■■■
                                  offset: const Offset(110 + x2, 206 + y2),
                                  child: const Text(
                                    '金',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate( // 水2階■■■■■■■■■
                                  offset: const Offset(84 + x2, 128 + y2),
                                  child: const Text(
                                    '水',
                                    style: TextStyle(
                                      fontSize: f1,
                                      color: Colors.white38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      const ListTile(
                        title: Text('■■■■■■■ この図の見方 ■■■■■■■',
                            style: TextStyle(
                              color: Color(c2),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            )),
                      ),
                      const ListTile(
                        title: SizedBox(
                          height: 1200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('■ 結婚運 ■',
                                  style: TextStyle(
                                    color: Color(c3),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　上の大きな白の円において、「＜」で区切られた部'
                                  '分は、日干を表し通変星で比肩・劫敗を表しています。ここから円の'
                                  '中心を向いて、右斜め奥方向に「官星」、左斜め奥方向に「財星」'
                                  'が位置しています。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　女性の場合は、官星方向にある白い数字を足した数が、'
                                  '「1」あるいは「2」の時は結婚運があるとみます。'
                                  '「0」あるいは「3以上」の時は結婚運がないとみます。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text('　男性の場合は、財星方向にある白い数字をみます。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　結婚運がないとなると、心配になりますが、さらに小さ'
                                  'い白い円（本質）をみます。上の大きな円と同じ方向の白い'
                                  '数字をみます。表面側が「0」でも本質側に数字があれば、'
                                  '先祖が準備した運があるとみます。ぜひ先祖供養をして、先'
                                  '祖が準備した運を取り込みましょう。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　本質にも数字がない時は、天が与える運をみます。天は、'
                                  '万民に平等に運勢を与えるため、昨日は癸の人、今日は甲の'
                                  '人、明日は乙の人という具合に順番に運勢を与えていきます。'
                                  '同様に月ごとに、また年ごとに運勢を与えていきます。その'
                                  '様子を、一番内側の青い円の中のピンク色の数字で表てしま'
                                  'す。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　いつ天の運勢がめぐってくるかを調べるには、右下の6つ'
                                  'の青いボタンをタップすると鑑定日が変化します。結婚運の'
                                  '方向にピンク色の数字が現れる年がチャンスの時です。その'
                                  '時に向けて準備をしましょう。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　準備とは、結婚運は、夫婦愛の問題になりますが、夫婦'
                                  '愛は、兄弟姉妹愛の土台の上に築くことができると言われて'
                                  'います。兄弟姉妹の愛は、狭い意味では、家族の兄弟姉妹で'
                                  'すが、広い意味では、地域や人類に対する愛になります。愛'
                                  'されたら、愛するのは、当たり前の行動ですが、兄弟姉妹の'
                                  '愛の本質は、その人から愛されたわけではないのに愛してい'
                                  'く愛を意味します。多くの人を兄弟姉妹のように愛していく'
                                  '努力をしましょう。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　結婚運がない場合で、星の数が「3以上」の場合は、多く'
                                  'の人に結婚相手として、気持ちが向いていたり、結婚してい'
                                  'ても、配偶者意外のひとに気持ちがいったり、言い寄られたり、'
                                  'また、逆に全く結婚する気持ちがなかったり、縁がなかった'
                                  'りという現象として現れます。結婚運が「1」や「2」でも、'
                                  '天の与える運によって、「3以上」になる場合は、やはりこ'
                                  'の現象が現れやすいので、配偶者をより愛し、誘惑に心を奪'
                                  'われないように厳しく自らを律する必要があります。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                              Text(
                                  '　表面が、結婚運があっても、本質に星がない場合も、注'
                                  '意が必要です。結婚運があるようでもはがれ落ちやすい結婚'
                                  '運です。結婚前なら、前述したように自分の愛のレベルを高'
                                  'める努力をし、結婚後なら配偶者に対しての愛もさらに高め'
                                  'る努力をしましょう。',
                                  style: TextStyle(
                                    color: Color(c2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 97,
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '年',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                yearBDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                yearBUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '月',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                monthBDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                monthBUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '日',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                dateBDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                dateBUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '年',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                yearDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                yearUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '月',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                monthDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                monthUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 15,
                            child: Text(
                              '日',
                              style: TextStyle(
                                color: Color(c3),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                dateDown();
                              },
                              child: const Text(
                                'ー',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: h1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                dateUp();
                              },
                              child: const Text(
                                '＋',
                                style: TextStyle(
                                  color: Color(c2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ShapePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center1 = const Offset(154, 164); // 表面の中心座標
    var center2 = const Offset(70, 378); // 本質の中心座標

    final penWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    final penBlue = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    double angleMoku = 72 * 0 - 90;
    double angleKa = 72 * 1 - 90;
    double angleDo = 72 * 2 - 90;
    double angleKin = 72 * 3 - 90;
    double angleSui = 72 * 4 - 90;
    double radianMoku = angleMoku / 180 * pi;
    double radianKa = angleKa / 180 * pi;
    double radianDo = angleDo / 180 * pi;
    double radianKin = angleKin / 180 * pi;
    double radianSui = angleSui / 180 * pi;
    final centerMoku1 =
        center1 + Offset(105 * cos(radianMoku), 105 * sin(radianMoku));
    final centerMoku2 =
        center1 + Offset(55 * cos(radianMoku), 55 * sin(radianMoku));
    final centerKa1 =
        center1 + Offset(105 * cos(radianKa), 105 * sin(radianKa));
    final centerKa2 = center1 + Offset(55 * cos(radianKa), 55 * sin(radianKa));
    final centerDo1 =
        center1 + Offset(105 * cos(radianDo), 105 * sin(radianDo));
    final centerDo2 = center1 + Offset(55 * cos(radianDo), 55 * sin(radianDo));
    final centerKin1 =
        center1 + Offset(105 * cos(radianKin), 105 * sin(radianKin));
    final centerKin2 =
        center1 + Offset(55 * cos(radianKin), 55 * sin(radianKin));
    final centerSui1 =
        center1 + Offset(105 * cos(radianSui), 105 * sin(radianSui));
    final centerSui2 =
        center1 + Offset(55 * cos(radianSui), 55 * sin(radianSui));

    canvas.drawCircle(center1, 30, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerMoku1, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerMoku2, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerKa1, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerKa2, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerDo1, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerDo2, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerKin1, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerKin2, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerSui1, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(centerSui2, 25, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(center1, 130, penWhite..style = PaintingStyle.stroke);

    // 本質チャートの描画
    canvas.drawCircle(center2, 30, penBlue..style = PaintingStyle.stroke);
    canvas.drawCircle(center2, 52, penWhite..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ShapePainter2 extends CustomPainter {
  int gogyou = 1; // 五行　0:木 1:火 2:土 3:金 4:水  // ■■■■■■受け取る値を代入する変数を定義
  ShapePainter2({required this.gogyou}); // ■■■■■■■■■受け取る値を上記変数に代入
  @override
  void paint(Canvas canvas, Size size) {
    var center1 = const Offset(154, 164); // 表面の中心座標
    var center2 = const Offset(70, 378); // 本質の中心座標
    const lineLength1 = 152.0;
    const lineLength2 = 68.0;

    final penWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    double radian1 = ((72 * gogyou) - 90 - 36) / 180 * pi;
    double radian2 = ((72 * gogyou) - 90 + 36) / 180 * pi;

    final line1 = center1 +
        Offset(lineLength1 * cos(radian1), lineLength1 * sin(radian1));
    final line2 = center1 +
        Offset(lineLength1 * cos(radian2), lineLength1 * sin(radian2));
    final line21 = center2 +
        Offset(lineLength2 * cos(radian1), lineLength2 * sin(radian1));
    final line22 = center2 +
        Offset(lineLength2 * cos(radian2), lineLength2 * sin(radian2));

    // canvas.drawLine(center1, line0, penRed); // 赤い中心線
    canvas.drawLine(center1, line1, penWhite);
    canvas.drawLine(center1, line2, penWhite);

    // 本質チャートの描画
    canvas.drawLine(center2, line21, penWhite);
    canvas.drawLine(center2, line22, penWhite);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
