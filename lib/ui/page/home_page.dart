import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/state/home_state.dart';
import 'package:karamemo/ui/component/atom/create_memo_button_body.dart';
import 'package:karamemo/ui/component/molecule/memo_type_combo.dart';
import 'package:karamemo/ui/component/organism/memo_card.dart';

import '../../model/controller/home_controller.dart';
import '../../model/view_data/memo.dart';
import '../../model/view_data/memo_type.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.watch(homeControllerProvider.notifier);

    useEffect(() {
      controller.getMemo();
      return;
    }, []);

    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("辛メモ🌶"),
        ),
        body: switch (state) {
          HomeStateInitial() => _EmptyBody(),
          HomeStateListing(list: final list) => _ListBody(list),
          HomeStateEmpty() => _EmptyBody(),
        },
        floatingActionButton: PopupMenuButton(
          itemBuilder: _makePopupItems,
          onSelected: _onMenuSelected,
          child: const CreateMemoButtonBody(),
        ));
  }

  List<PopupMenuEntry<dynamic>> _makePopupItems(BuildContext context) {
    const item1 = PopupMenuItem<MemoType>(
      value: MemoType.shopOnly,
      child: MemoTypeCombo('お店の辛さメモ', 'スープカレー屋の辛さなど'),
    );
    const item2 = PopupMenuItem<MemoType>(
      value: MemoType.shopAndItem,
      child: MemoTypeCombo('メニューの辛さメモ', '専門店じゃないお店に辛いメニューがあるときなど'),
    );
    const item3 = PopupMenuItem<MemoType>(
      value: MemoType.itemOnly,
      child: MemoTypeCombo('商品の辛さメモ', 'コンビニやスーパーの辛い商品など'),
    );
    return [item1, item2, item3];
  }

  void _onMenuSelected(dynamic type) {
    print("selected $type");
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody(this.list);

  final List<Memo> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => MemoCard(memo: list[index])),
    );
  }
}

class _EmptyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'メモがありません',
          ),
        ],
      ),
    );
  }
}
