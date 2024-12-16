extension DynamicListToStringExtension on List<dynamic>? {
  List<String> toStringList() {
    return this?.map((e) => e.toString()).toList() ?? [];
  }
}
