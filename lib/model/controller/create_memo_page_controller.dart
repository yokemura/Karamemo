import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/state/create_memo_page_state.dart';

import '../view_data/memo.dart';
import '../view_data/memo_type.dart';

final createMemoPageControllerProvider = StateNotifierProvider.autoDispose<
    CreateMemoPageController,
    CreateMemoPageState>((ref) => CreateMemoPageController());

class CreateMemoPageController extends StateNotifier<CreateMemoPageState> {
  CreateMemoPageController() : super(const CreateMemoPageState());

  void setMemoType(MemoType type) {
    state = state.copyWith(type: type);
  }

  void setSpicinessAvailable(bool isAvailable) {
    state = state.copyWith(isSpicinessAvailable: isAvailable);
  }

  void onShopNameChanged(String name) {
    state = state.copyWith(shopName: name);
  }

  void onItemNameChanged(String name) {
    state = state.copyWith(itemName: name);
  }

  void onSpicinessNameChanged(String name) {
    state = state.copyWith(nominalSpiciness: name);
  }

  void onJudgeChanged(Judge? judge) {
    state = state.copyWith(judge: judge);
  }
}
