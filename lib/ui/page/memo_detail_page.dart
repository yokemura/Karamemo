import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/memo_detail_page_controller.dart';
import 'package:karamemo/model/view_data/page_parameters.dart';
import 'package:karamemo/ui/component/organism/memo_detail_combo.dart';

import '../../model/view_data/memo.dart';
import '../route.dart';

class MemoDetailPage extends HookConsumerWidget {
  const MemoDetailPage({
    required Memo memo,
    super.key,
  }) : initialMemo = memo;

  final Memo initialMemo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedList = ref.watch(memoDetailPageControllerProvider
        .select((state) => state.relatedMemo));
    final memo = ref.watch(memoDetailPageControllerProvider
        .select((state) => state.memo));
    final controller =
        ref.watch(memoDetailPageControllerProvider.notifier);
    ref.listen(
        memoDetailPageControllerProvider.select((s) => s.shouldGoBack),
        (_, should) {
      if (should) {
        context.pop();
      }
    });

    useEffect(() {
      Future.microtask(() => controller.reload(initialMemo));
      return null;
    }, []);

    if (memo == null) {
      return const Scaffold();
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
                controller.reload(updatedMemo as Memo?);
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
                controller.goBack();
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
