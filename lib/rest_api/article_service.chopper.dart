// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ArticleService extends ArticleService {
  _$ArticleService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ArticleService;

  @override
  Future<Response<Result>> getBestArticles(String apiKey) {
    final $url = 'topstories/v2/home.json';
    final $params = <String, dynamic>{'api-key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Result, Result>($request);
  }
}
