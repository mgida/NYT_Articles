import 'package:chopper/chopper.dart';
import 'package:nyt_articles/model/result.dart';
import 'package:nyt_articles/utils/model_converter.dart';

part 'article_service.chopper.dart';

@ChopperApi()
abstract class ArticleService extends ChopperService {
  @Get(path: 'topstories/v2/home.json')
  Future<Response<Result>> getBestArticles(@Query('api-key') String apiKey);

  static ArticleService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.nytimes.com/svc/',
      services: [
        _$ArticleService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: ModelConverter(),
      errorConverter: JsonConverter(),
    );
    return _$ArticleService(client);
  }
}
