extension NumExtension on double? {
  String convertToPrecentageString() {
    return ((this ?? 0) * 10).toString() + "%";
  }
}
