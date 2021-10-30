import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/src/todo/pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: TodoListPage, name: 'TodoListRoute', initial: true),
  ],
)
class $AppRouter {}
