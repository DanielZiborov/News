part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;
  final DioException? error;

  const RemoteArticlesState({
    this.articles = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [articles, noMoreData, error];
}

final class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}
final class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({super.articles,super.noMoreData});
}
final class RemoteArticlesFailed extends RemoteArticlesState {
  const RemoteArticlesFailed({super.error});
}
