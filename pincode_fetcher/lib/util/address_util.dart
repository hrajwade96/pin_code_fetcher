extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this; // Return empty string as is
    }

    List<String> words = split(' ');
    StringBuffer result = StringBuffer();

    for (String word in words) {
      if (word.isNotEmpty) {
        result.write(
            '${word[0].toUpperCase()}${word.substring(1).toLowerCase()} ');
      }
    }

    // Remove the trailing space and return the result
    return result.toString().trim();
  }
}
