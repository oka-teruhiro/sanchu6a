//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const header = DrawerHeader(
      child: Text('メニュー'),
    );
    final tileA = ListTile(
      title: const Text('プロフィール'),
      onTap: () {
        print('リストタイルA');
      },
    );
    final tileB = ListTile(
      title: const Text('アップデート'),
      onTap: () {
        print('リストタイルB');
      },
    );
    final list = ListView(
      children: [
        header,
        tileA,
        tileB,
      ],

    );
    return list;
  }
}
