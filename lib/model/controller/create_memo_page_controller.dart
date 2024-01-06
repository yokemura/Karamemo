import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karamemo/model/state/create_memo_page_state.dart';

final createMemoPageControllerProvider =
    StateNotifierProvider<CreateMemoPageController, CreateMemoPageState>(
        (ref) => CreateMemoPageController());

class CreateMemoPageController extends StateNotifier<CreateMemoPageState> {
  CreateMemoPageController() : super(const CreateMemoPageState());
}
