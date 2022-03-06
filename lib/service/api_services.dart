import 'package:evaluation_projrct/model/article_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String _baseUrl = 'api.nytimes.com';
  static const String _apiKey = '9vXhMELWONr8AvdAcqKIBNohQ5XoClx9';
  Map<String, String> parameters = {'api-key': _apiKey};

  Future<Result> fetchArticlesBySearch(String searchQuery) async {
    parameters.addAll({'q': searchQuery});
    Uri uri = Uri.https(
      _baseUrl,
      '/svc/search/v2/articlesearch.json',
      parameters,
    );
    try {
      final http.Response response = await http.get(uri);

      final Result articles = articleFromJson(response.body);

      return articles;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Result> fetchArticlesByMostViewed() async {
    Uri uri = Uri.https(
      _baseUrl,
      '/svc/mostpopular/v2/viewed/1.json',
      parameters,
    );
    try {
      final http.Response response = await http.get(uri);

      final Result articles = filteredArticleFromJson(response.body);

      return articles;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Result> fetchArticlesByMostShared() async {
    Uri uri = Uri.https(
      _baseUrl,
      '/svc/mostpopular/v2/shared/1/facebook.json',
      parameters,
    );
    try {
      final http.Response response = await http.get(uri);

      final Result articles = filteredArticleFromJson(response.body);

      return articles;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Result> fetchArticlesByMostEmailed() async {
    Uri uri = Uri.https(
      _baseUrl,
      '/svc/mostpopular/v2/emailed/7.json',
      parameters,
    );
    try {
      final http.Response response = await http.get(uri);

      final Result articles = filteredArticleFromJson(response.body);

      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
