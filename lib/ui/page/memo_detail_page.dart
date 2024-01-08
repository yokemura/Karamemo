import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('メモ詳細'),
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
}
