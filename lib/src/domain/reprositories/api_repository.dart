import 'package:news/src/domain/models/requests/breaking_news_request.dart';
import 'package:news/src/domain/models/responses/breaking_news_response.dart';
import 'package:news/src/utils/resourses/data_state.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  });
}
