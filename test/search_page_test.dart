import 'package:evaluation_projrct/helpers/validation_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty search field return error', () {
    final result = SearchValidator.validate(null);
    expect(result, 'Search cannot be empty');
  });
  test('Non Empty Filed Return null (means nor error)', () {
    final result = SearchValidator.validate('election');
    expect(result, null);
  });
}
