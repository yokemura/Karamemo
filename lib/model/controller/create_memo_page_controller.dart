import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/state/create_memo_page_state.dart';

final createMemoPageControllerProvider =
    StateNotifierProvider<CreateMemoPageController, CreateMemoPageState>(
        (ref) => CreateMemoPageController());

class CreateMemoPageController extends StateNotifier<CreateMemoPageState> {
  CreateMemoPageController() : super(const CreateMemoPageState());

  void onShopNameChanged(String name) {
    state = state.copyWith(shopName: name);
  }

  void onItemNameChanged(String name) {
    state = state.copyWith(itemName: name);
  }

  void onSpicinessNameChanged(String name) {
    state = state.copyWith(nominalSpiciness: name);
  }
}
