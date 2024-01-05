import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/state/home_state.dart';
import 'package:karamemo/ui/component/organism/memo_card.dart';

import '../../model/controller/home_controller.dart';
import '../../model/view_data/memo.dart';

class HomePage extends HookConsumerWidget {
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
        floatingActionButton:
            FloatingActionButton(
              onPressed: () => {}, tooltip: '新規メモ作成',
              child: const Icon(Icons.add_rounded)),);
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
