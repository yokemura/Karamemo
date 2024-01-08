import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/view_data/memo.dart';

class LocalData {
  Future<void> saveMemos(List<Memo> memos) async {
    final prefs = await SharedPreferences.getInstance();

    final stringArray = memos.map((memo) {
      final jsonMap = memo.toJson();
      return jsonEncode(jsonMap).toString();
    }).toList();

    prefs.setStringList('memos', stringArray);

  }
}