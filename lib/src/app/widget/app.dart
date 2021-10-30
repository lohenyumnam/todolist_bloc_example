import 'package:bloc_example/src/app/widget/milti_bloc_provider.wrapper.dart';
import 'package:flutter/material.dart';
import '../../router/router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProviderWrapper(
      child: MaterialApp.router(
        title: 'Todo',
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
