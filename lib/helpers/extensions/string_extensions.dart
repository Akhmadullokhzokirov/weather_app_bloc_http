extension StringExtension on String {
  String capitaliSizeString() => '${this[0].toUpperCase()}${this.substring(1)}';
}
