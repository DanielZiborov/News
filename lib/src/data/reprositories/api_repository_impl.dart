import 'package:news/src/data/datasourses/remote/news_api_service.dart';
import 'package:news/src/data/reprositories/base/base_api_repository.dart';
import 'package:news/src/domain/models/requests/breaking_news_request.dart';
import 'package:news/src/domain/models/responses/breaking_news_response.dart';
import 'package:news/src/domain/reprositories/api_repository.dart';
import 'package:news/src/utils/resourses/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService newsApiService;

  ApiRepositoryImpl(this.newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  }) {
    return getStateOf<BreakingNewsResponse>(
      request: () => newsApiService.getBreakingNewsArticles(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
