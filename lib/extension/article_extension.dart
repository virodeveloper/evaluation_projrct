import 'package:evaluation_projrct/model/article_model.dart';
import 'package:intl/intl.dart';

extension ArticleExtension on Article {
  String get publishingDate {
    try {
      final dateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ssZ").parse(utc, true);
      return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    } catch (_) {
      return utc;
    }
  }
}
