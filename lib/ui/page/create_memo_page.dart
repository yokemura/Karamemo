import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/create_memo_page_controller.dart';
import 'package:material_text_fields/labeled_text_field.dart';
import 'package:material_text_fields/material_text_fields.dart';

class CreateMemoPage extends HookConsumerWidget {
  const CreateMemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAcceptable = ref.watch(
        createMemoPageControllerProvider.select((value) => value.isAcceptable));
    final pageController = ref.watch(createMemoPageControllerProvider.notifier);
    /* 初期値反映のときに使う予定
    final shopFieldController = useTextEditingController();
    final  itemFieldController = useTextEditingController();
    final  spicinessFieldController = useTextEditingController();
  */

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("新規メモ作成"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LabeledTextField(
              title: 'お店の名前',
              textField: MaterialTextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: pageController.onShopNameChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
