import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:karamemo/ui/page/create_memo_page.dart';
import 'package:karamemo/ui/page/home_page.dart';

import '../model/view_data/memo_type.dart';

enum PageName {
  home,
  createMemo;

  String get defaultPath => '/$this.name';
}

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      routes: [
        GoRoute(
            name: PageName.home.name,
            path: PageName.home.defaultPath,
            builder: (context, state) => const HomePage()),
        GoRoute(
            name: PageName.createMemo.name,
            path: '${PageName.createMemo.defaultPath}/:type',
            builder: (context, state) {
              final memoTypeStr = state.pathParameters['type'];
              final memoType = MemoType.values.byName(memoTypeStr!);
              return CreateMemoPage(memoType: memoType);
            }),
      ],
      initialLocation: PageName.home.defaultPath,
    ));
