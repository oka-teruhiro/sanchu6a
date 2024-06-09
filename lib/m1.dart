import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanch6a/page_a.dart';
import 'package:sanch6a/page_b.dart';
import 'package:sanch6a/page_c.dart';

main() {
  // アプリ
  const app = MaterialApp(
    home: Root(),
  );

  // プロバイダースコープでアプリを囲む
  const scope = ProviderScope(child: app);
  runApp(scope);
}

// プロバイダー
final indexProvider = StateProvider(
  (ref) {
    // 変化させたいデータ => 0, 1, 2
    return 0;
  },
);

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックスを手に入れる
    final index = ref.watch(indexProvider);

    // アイテムたち
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'アイテムA',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'アイテムB',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'アイテムC',
      ),
    ];

    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap: (index) {
        // タップされたとき　インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );

    // 画面たち
    final pagrs = [
      const PageA(),
      const PageB(),
      const PageC(),
    ];

    return Scaffold(
      body: pagrs[index],
      bottomNavigationBar: bar,
    );
  }
}
