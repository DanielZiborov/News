import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news/src/config/router/app_router.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'package:news/src/presentation/widgets/article_widget.dart';

@RoutePage()
class SaveArticlesDetailsScreen extends StatelessWidget {
  const SaveArticlesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.router.back(),
          child: const Icon(
            Ionicons.chevron_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Saved Articles',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<LocalArticlesCubit, LocalArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case const (LocalArticlesLoading):
              return const Center(child: CupertinoActivityIndicator());
            case const (LocalArticlesSuccess):
              return _buildArticlesList(state.articles);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => BlocProvider.of<LocalArticlesCubit>(context)
              .removeArticle(article: article),
          onArticlePressed: (article) => context.router.push(
            ArticlesDetailsRoute(article: article),
          ),
        );
      },
    );
  }
}
