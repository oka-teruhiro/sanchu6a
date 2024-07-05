import 'package:flutter/material.dart';
import 'package:sanch6a/manual_page.dart';
import 'package:sanch6a/osirase/profile.dart';
import 'osirase/update.dart';

class SideMenu extends StatelessWidget {
  final String apptitle; // 6.1.35
  const SideMenu({
    super.key,
    required this.apptitle,
  });

  @override
  Widget build(BuildContext context) {

     var header = DrawerHeader(
      child: Column(
        children: [
          ListTile(
            title: SizedBox(
              height: 70,
                child: Image.asset('assets/images/icon/icon_uranai_x512.png'),
            ),
          ),
          Text(
            apptitle, // 6.1.35
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    final tileA = ListTile(
      title: const Text('プロフィール'),
      onTap: () {
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Update(),
            ));
      },
    );
     final tileC = ListTile(
       title: const Text('このアプリの使い方'),
       onTap: () {
         Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => const ManualPage(),
             ));
       },
     );
    final list = ListView(
      children: [
        header,
        tileC,
        tileB,
        tileA,
      ],

    );
    return list;
  }
}
