import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/memo_detail_page_controller.dart';
import 'package:karamemo/model/state/memo_detail_page_state.dart';
import 'package:karamemo/model/view_data/page_parameters.dart';
import 'package:karamemo/ui/component/organism/memo_detail_combo.dart';

import '../../model/view_data/memo.dart';
import '../route.dart';

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
    final resumeEvent = ref.watch(
        memoDetailPageControllerProvider(memo).select((s) => s.resumeEvent));
    switch(resumeEvent.value) {
      case MemoDetailPageResumeEvent.pop:
        Future.microtask(() => context.pop());
      default:
        break; // will reload
    }

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
              tooltip: 'メモを編集',
              onPressed: () async {
                final path = PageName.createMemo.path;
                final parameter = CreateMemoPageParameter(
                  mode: CreateMemoPageMode.reedit,
                  memoType: memo.memoType,
                  originalMemo: memo,
                );
                final updatedMemo = await context.push(path, extra: parameter);
                controller.triggerEvent(MemoDetailPageResumeEvent.reload);
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              tooltip: 'コピーを作成',
              onPressed: () async {
                final path = PageName.createMemo.path;
                final parameter = CreateMemoPageParameter(
                  mode: CreateMemoPageMode.editCopy,
                  memoType: memo.memoType,
                  originalMemo: memo.duplicated(),
                );
                await context.push(path, extra: parameter);
                controller.triggerEvent(MemoDetailPageResumeEvent.pop);
              },
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
