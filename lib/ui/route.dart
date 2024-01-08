import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:karamemo/model/view_data/page_parameters.dart';
import 'package:karamemo/ui/page/create_memo_page.dart';
import 'package:karamemo/ui/page/home_page.dart';
import 'package:karamemo/ui/page/memo_detail_page.dart';

import '../model/view_data/memo.dart';
import '../model/view_data/memo_type.dart';

enum PageName {
  home,
  createMemo,
  memoDetail;

  String get path => '/$this.name';
}

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      routes: [
        GoRoute(
            name: PageName.home.name,
            path: PageName.home.path,
            builder: (context, state) => const HomePage()),
        GoRoute(
            name: PageName.createMemo.name,
            path: PageName.createMemo.path,
            builder: (context, state) {
              final parameter = state.extra as CreateMemoPageParameter;
              return CreateMemoPage(parameter: parameter);
            }),
        GoRoute(
            name: PageName.memoDetail.name,
            path: PageName.memoDetail.path,
            builder: (context, state) {
              final memo = state.extra as Memo;
              return MemoDetailPage(memo: memo);
            }),
      ],
      initialLocation: PageName.home.path,
    ));
