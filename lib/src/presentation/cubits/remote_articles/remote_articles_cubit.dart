import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news/src/domain/models/article.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit extends Cubit<RemoteArticlesState> {
  RemoteArticlesCubit() : super(const RemoteArticlesLoading());
}
