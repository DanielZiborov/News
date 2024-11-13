import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/presentation/views/articles_details_screen.dart';
import 'package:news/src/presentation/views/breaking_news_screen.dart';
import 'package:news/src/presentation/views/save_articles_details_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BreakingNewsRoute.page, initial: true),
        AutoRoute(page: ArticlesDetailsRoute.page),
        AutoRoute(page: SaveArticlesDetailsRoute.page),
      ];
}
