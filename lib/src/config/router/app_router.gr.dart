// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ArticlesDetailsScreen]
class ArticlesDetailsRoute extends PageRouteInfo<ArticlesDetailsRouteArgs> {
  ArticlesDetailsRoute({
    Key? key,
    required Article article,
    List<PageRouteInfo>? children,
  }) : super(
          ArticlesDetailsRoute.name,
          args: ArticlesDetailsRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticlesDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticlesDetailsRouteArgs>();
      return ArticlesDetailsScreen(
        key: args.key,
        article: args.article,
      );
    },
  );
}

class ArticlesDetailsRouteArgs {
  const ArticlesDetailsRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'ArticlesDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [BreakingNewsScreen]
class BreakingNewsRoute extends PageRouteInfo<void> {
  const BreakingNewsRoute({List<PageRouteInfo>? children})
      : super(
          BreakingNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BreakingNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BreakingNewsScreen();
    },
  );
}

/// generated route for
/// [SaveArticlesDetailsScreen]
class SaveArticlesDetailsRoute extends PageRouteInfo<void> {
  const SaveArticlesDetailsRoute({List<PageRouteInfo>? children})
      : super(
          SaveArticlesDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveArticlesDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SaveArticlesDetailsScreen();
    },
  );
}
