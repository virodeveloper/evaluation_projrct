class SearchValidator {
  static String? validate(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Search cannot be empty';
    }
  }
}
