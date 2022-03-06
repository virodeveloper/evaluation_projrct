import 'package:evaluation_projrct/model/article_model.dart';
import 'package:evaluation_projrct/service/api_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetching data for search Query', () async {
    final result = await APIService().fetchArticlesBySearch('election');

    expect(result, isA<Result>());
  });

  test('fetching data for most viewed', () async {
    final result = await APIService().fetchArticlesByMostViewed();

    expect(result, isA<Result>());
  });

  test('fetching values for most shared', () async {
    final result = await APIService().fetchArticlesByMostShared();

    expect(result, isA<Result>());
  });

  test('fetching values for most emailed', () async {
    final result = await APIService().fetchArticlesByMostEmailed();

    expect(result, isA<Result>());
  });
}
