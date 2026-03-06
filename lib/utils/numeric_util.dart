class NumericUtil {
  static bool isDouble(String str) {
    return double.tryParse(str) != null;
  }

  static double parseDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
