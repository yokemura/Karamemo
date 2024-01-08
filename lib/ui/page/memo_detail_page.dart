import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/memo_detail_page_controller.dart';
import 'package:karamemo/ui/component/organism/memo_detail_combo.dart';

import '../../model/view_data/memo.dart';

class MemoDetailPage extends HookConsumerWidget {
  const MemoDetailPage({
    required this.memo,
    super.key,
  });

  final Memo memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedList = ref.watch(memoDetailPageControllerProvider(memo)
        .select((state) => state.relatedMemo));
    final controller =
        ref.watch(memoDetailPageControllerProvider(memo).notifier);
    ref.listen(memoDetailPageControllerProvider(memo).select((s) => s.deleteCompleted), (_, completed) {
      context.pop();
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('メモ詳細'),
        actions: [
          IconButton(
            tooltip: 'メモを削除',
            onPressed: () => _deleteButtonPressed(context, controller),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
              tooltip: 'メモを編集', onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(
              tooltip: 'コピーを作成',
              onPressed: () {},
              icon: const Icon(Icons.copy)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              MemoDetailCombo(memo),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteButtonPressed(
    BuildContext context,
    MemoDetailPageController controller,
  ) {
    AlertDialog alert = AlertDialog(
      title: const Text("このメモを削除しますか？"),
      actions: [
        MaterialButton(
          child: const Text("キャンセル"),
          onPressed: () {
            context.pop(); // close dialog
          },
        ),
        MaterialButton(
          child: const Text("削除"),
          onPressed: () {
            context.pop(); // close dialog
            controller.deleteMemo();
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
