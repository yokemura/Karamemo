import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/create_memo_page_controller.dart';

class CreateMemoPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAcceptable = ref.watch(createMemoPageControllerProvider.select((value) => value.isAcceptable));

    return Scaffold(appBar:  AppBar(
      elevation: 2,
      title: const Text("新規メモ作成"),
    ), body: SizedBox(),
      
    );
  }


}