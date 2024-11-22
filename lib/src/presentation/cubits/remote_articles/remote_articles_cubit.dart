import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/domain/models/requests/breaking_news_request.dart';
import 'package:news/src/domain/reprositories/api_repository.dart';
import 'package:news/src/presentation/cubits/base/base_cubit.dart';
import 'package:news/src/utils/constants/numeric.dart';
import 'package:news/src/utils/resourses/data_state.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);
  int page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;
    await run(
      () async {
        final response = await _apiRepository.getBreakingNewsArticles(
          request: BreakingNewsRequest(page: page),
        );

        if (response is DataSuccess) {
          final articles = response.data!.articles;
          final noMoreData = articles.length < defaultPageSize;

          if (articles.isNotEmpty) {
            data.addAll(articles);
            page++;
          }

          emit(RemoteArticlesSuccess(
            articles: data,
            noMoreData: noMoreData,
          ));
        } else if (response is DataFailed) {
          emit(RemoteArticlesFailed(error: response.error));
        }
      },
    );
  }
}
