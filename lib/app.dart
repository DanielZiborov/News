import 'package:flutter/material.dart';
import 'package:news/src/config/router/app_router.dart';
import 'package:news/src/config/themes/app_themes.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        theme: AppThemes.light,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
