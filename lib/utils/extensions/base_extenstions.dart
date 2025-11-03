extension listExtensions on List {
  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  List<T> whereType<T>() => where((element) => element is T).cast<T>().toList();
}

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}

extension texts on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
  String numberFormatter() {
    String formatted = replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return formatted;
  }
}
