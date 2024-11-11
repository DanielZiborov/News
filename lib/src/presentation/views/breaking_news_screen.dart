import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:news/src/presentation/widgets/article_widget.dart';
import 'package:news/src/utils/extensions/scroll_controller.dart';

@RoutePage()
class BreakingNewsScreen extends StatefulWidget {
  const BreakingNewsScreen({super.key});

  @override
  _BreakingNewsScreenState createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  late ScrollController _scrollController;
  late RemoteArticlesCubit _remoteArticlesCubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);

    _scrollController.onScrollEndsListener(() {
      _remoteArticlesCubit.getBreakingNewsArticles();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case const (RemoteArticlesLoading):
              return const Center(child: CupertinoActivityIndicator());
            case const (RemoteArticlesFailed):
              return const Center(child: Icon(Ionicons.refresh));
            case const (RemoteArticlesSuccess):
              return _buildArticles(
                _scrollController,
                state.articles,
                state.noMoreData,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticles(
    ScrollController scrollController,
    List<Article> articles,
    bool noMoreData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleWidget(
              article: articles[index],
            ),
            childCount: articles.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}
