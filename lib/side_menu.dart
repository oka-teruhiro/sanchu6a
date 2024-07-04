//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanch6a/osirase/profile.dart';

import 'osirase/update.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const header = DrawerHeader(
      child: Text('天運三柱推命',

      ),
    );
    final tileA = ListTile(
      title: const Text('プロフィール'),
      onTap: () {
        //print('リストタイルA');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Profile(),
            ));
      },
    );
    final tileB = ListTile(
      title: const Text('アップデート'),
      onTap: () {
        //print('リストタイルB');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Update(),
            ));
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
