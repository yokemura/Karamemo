import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:karamemo/model/controller/create_memo_page_controller.dart';
import 'package:karamemo/ui/component/molecule/judge_icon_combo_full_size.dart';
import 'package:material_text_fields/labeled_text_field.dart';
import 'package:material_text_fields/material_text_fields.dart';

import '../../model/view_data/memo.dart';
import '../../model/view_data/memo_type.dart';
import '../component/molecule/form_section_index.dart';
import '../component/organism/radio_combo.dart';
import '../component/organism/text_radio_combo.dart';

class CreateMemoPage extends HookConsumerWidget {
  const CreateMemoPage({
    required this.originalMemo,
    super.key,
  });

  final Memo originalMemo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAcceptable = ref.watch(
        createMemoPageControllerProvider(originalMemo)
            .select((value) => value.isAcceptable));
    final isSpicinessAvailable = ref.watch(
        createMemoPageControllerProvider(originalMemo)
            .select((value) => value.isSpicinessAvailable));
    final judge = ref.watch(createMemoPageControllerProvider(originalMemo)
        .select((value) => value.judge));
    final memoType = originalMemo.memoType;

    final pageTitle = switch (memoType) {
      MemoType.shopOnly => 'お店のメモ作成',
      MemoType.shopAndItem => 'メニューのメモ作成',
      MemoType.itemOnly => '商品のメモ作成',
    };
    final pageController =
        ref.watch(createMemoPageControllerProvider(originalMemo).notifier);

    useEffect(() {
      Future.microtask(() {
        pageController.copyValuesFromOriginalMemo();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(pageTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormSectionIndex(text: 'メニューの情報'),
                      _ItemInfoForm(
                        originalMemo: originalMemo,
                        isSpicinessAvailable: isSpicinessAvailable,
                        pageController: pageController,
                      ),
                      const FormSectionIndex(text: 'あなたの評価'),
                      _JudgeForm(judge: judge, pageController: pageController),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: isAcceptable
                    ? () {
                        pageController.saveMemo();
                        context.pop();
                      }
                    : null,
                child: const Text('登録'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemInfoForm extends HookWidget {
  const _ItemInfoForm({
    required this.originalMemo,
    required this.isSpicinessAvailable,
    required this.pageController,
  });

  final Memo originalMemo;
  final bool isSpicinessAvailable;
  final CreateMemoPageController pageController;

  @override
  Widget build(BuildContext context) {
    final memoType = originalMemo.memoType;

    final showsShopNameField = memoType != MemoType.itemOnly;
    final showsItemNameField = memoType != MemoType.shopOnly;
    final itemNameString = switch (memoType) {
      MemoType.itemOnly => '商品名',
      _ => 'メニュー名',
    };

    final shopFieldController =
        useTextEditingController(text: originalMemo.shopName);
    final itemFieldController =
        useTextEditingController(text: originalMemo.itemName);
    final spicinessFieldController =
        useTextEditingController(text: originalMemo.nominalSpiciness);

    return Column(
      children: [
        if (showsShopNameField) ...[
          LabeledTextField(
            title: 'お店の名前',
            textField: MaterialTextField(
              controller: shopFieldController,
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
              controller: itemFieldController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: pageController.onItemNameChanged,
            ),
          ),
          const SizedBox(height: 24),
        ],
        TextRadioCombo<bool>(
          title: '辛さレベル有無',
          items: [
            TextRadioComboItem('あり', true),
            TextRadioComboItem('なし', false),
          ],
          value: isSpicinessAvailable,
          onSelected: pageController.setSpicinessAvailable,
        ),
        if (isSpicinessAvailable) ...[
          LabeledTextField(
            title: '辛さレベル（「大辛」「10」等）',
            textField: MaterialTextField(
              controller: spicinessFieldController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: pageController.onSpicinessNameChanged,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }
}

class _JudgeForm extends StatelessWidget {
  const _JudgeForm({
    required this.judge,
    required this.pageController,
  });

  final Judge? judge;
  final CreateMemoPageController pageController;

  @override
  Widget build(BuildContext context) {
    return RadioCombo<Judge>(
      items: Judge.values
          .map((e) => RadioComboItem<Judge>(
                JudgeIconComboFullSize(e),
                e,
              ))
          .toList(),
      value: judge,
      onSelected: pageController.onJudgeChanged,
    );
  }
}
