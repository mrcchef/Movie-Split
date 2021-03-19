extension NumExtension on num {
  String convertToPrecentageString() {
    return ((this ?? 0) * 10).toString() + "%";
  }
}
