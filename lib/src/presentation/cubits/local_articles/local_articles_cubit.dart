import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/domain/reprositories/database_repository.dart';

part 'local_articles_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository)
      : super(const LocalArticlesLoading());

  Future<LocalArticlesState> _getAllSavedArticles() async {
    final articles = await _databaseRepository.getSavedArticles();
    return LocalArticlesSuccess(articles: articles);
  }

  Future<void> removeArticle({required Article article}) async {
    await _databaseRepository.removeArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<void> saveArticle({required Article article}) async {
    await _databaseRepository.saveArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<void> getAllSavedArticles() async {
    emit(await _getAllSavedArticles());
  }
}