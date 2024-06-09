import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  // 進むボタンを押したとき
  push(BuildContext context){
    // 画面Bに進む
    context.push('/c');
  }

  // 戻るボタンを押したとき
  pop(BuildContext context){
    // 画面Bに進む
    context.pop('/c');
  }

  @override
  Widget build(BuildContext context) {
    // 画面の上に表示するバー
    final appBar = AppBar(
      backgroundColor: Colors.orange,
      title: const Text('画面B'),
    );

    // 進むボタン
    final pushButton = ElevatedButton(
      onPressed: () {
        push(context);
      },
      child: const Text('進む'),
    );

    // 戻るボタン
    final popButton = ElevatedButton(
      onPressed: () {
        pop(context);
      },
      child: const Text('戻る'),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              pushButton,
              popButton,
            ],
          ),
        ),
      ),
    );
  }
}
