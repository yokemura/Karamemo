extension HasValue on String? {
  bool get hasValue {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return false;
    }
    return true;
  }
}