import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/config/router/app_router.dart';
import 'package:news/src/config/themes/app_themes.dart';
import 'package:news/src/domain/reprositories/api_repository.dart';
import 'package:news/src/locator.dart';
import 'package:news/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles(),
        ),
      ],
      child: OKToast(
        child: MaterialApp.router(
          theme: AppThemes.light,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
