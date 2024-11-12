import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/src/domain/models/article.dart';
import 'package:news/src/domain/reprositories/database_repository.dart';

part 'local_articles_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesState> {
  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository)
      : super(const LocalArticlesLoading());

  Future<void> getAllSavedArticles async {
    
  }
}
