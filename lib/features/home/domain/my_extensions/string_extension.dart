extension MyStringExtension on String {
  /// Set [capitalizeAllFirstCharAfterSpace] to true to enable uppercasing the first character of each word.
  ///
  /// This is my original written code Oct 10, 2026 -inogami
  String toCapitalizeFirst([bool capitalizeAllFirstCharAfterSpace = false]) {
    if (isEmpty) return this;
    if (capitalizeAllFirstCharAfterSpace) {
      return _capitalizedCharactersAfterSpace();
    }

    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String _capitalizedCharactersAfterSpace() {
    final List words = [];
    if (contains(" ")) {
      words.addAll(
        split(" ").map((word) {
          return word.toCapitalizeFirst();
        }).toList(),
      );
      return words.join(" ");
    }

    return this;
  }
}
