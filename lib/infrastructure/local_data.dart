import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/view_data/memo.dart';

final localDataProvider = Provider<LocalData>((ref) => LocalData());

class LocalData {
  Future<void> saveMemos(List<Memo> memos) async {
    final prefs = await SharedPreferences.getInstance();

    final stringArray = memos.map((memo) {
      final jsonMap = memo.toJson();
      return jsonEncode(jsonMap).toString();
    }).toList();

    prefs.setStringList('memos', stringArray);
  }

  Future<List<Memo>> loadMemos() async {
    final prefs = await SharedPreferences.getInstance();
    final stringArray = prefs.getStringList('memos');
    if (stringArray == null) {
      return [];
    }

    final memos = stringArray.map((str) {
      final jsonMap = jsonDecode(str);
      return Memo.fromJson(jsonMap);
    }).toList();
    return memos;
  }
}