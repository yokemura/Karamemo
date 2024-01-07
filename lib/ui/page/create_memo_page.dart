import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/create_memo_page_controller.dart';
import 'package:material_text_fields/labeled_text_field.dart';
import 'package:material_text_fields/material_text_fields.dart';

import '../../model/view_data/memo_type.dart';
import '../component/organism/radio_combo.dart';

class CreateMemoPage extends HookConsumerWidget {
  const CreateMemoPage({
    required this.memoType,
    super.key,
  });

  final MemoType memoType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAcceptable = ref.watch(
        createMemoPageControllerProvider.select((value) => value.isAcceptable));
    final isSpicinessAvailable = ref.watch(createMemoPageControllerProvider
        .select((value) => value.isSpicinessAvailable));

    final pageController = ref.watch(createMemoPageControllerProvider.notifier);
    final showsShopNameField = memoType != MemoType.itemOnly;
    final showsItemNameField = memoType != MemoType.shopOnly;
    final itemNameString = switch (memoType) {
      MemoType.itemOnly => '商品名',
      _ => 'メニュー名',
    };

    useEffect(() {
      return null;
    }, []);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.setMemoType(memoType);
    });
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      if (showsShopNameField) ...[
                        LabeledTextField(
                          title: 'お店の名前',
                          textField: MaterialTextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: pageController.onShopNameChanged,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (showsItemNameField) ...[
                        LabeledTextField(
                          title: itemNameString,
                          textField: MaterialTextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: pageController.onShopNameChanged,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      RadioCombo<bool>(
                        title: '辛さレベル有無（大辛, 辛さ1〜10 等）',
                        items: [
                          RadioComboItem('あり', true),
                          RadioComboItem('なし', false),
                        ],
                        value: isSpicinessAvailable,
                        onSelected: pageController.setSpicinessAvailable,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: isAcceptable ? () {} : null,
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}
