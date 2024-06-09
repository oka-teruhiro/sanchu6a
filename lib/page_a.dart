import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  // 進むボタンを押したとき
  push(BuildContext context){
    // 画面Bに進む
    context.push('/b');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.orange,
      title: const Text('画面A'),
    );

    // 進むボタン
    final pushButton = ElevatedButton(
      onPressed: () {
        push(context);
      },
      child: const Text('進む'),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.amberAccent,
        child: Center(child: pushButton),
      ),
    );
  }
}
