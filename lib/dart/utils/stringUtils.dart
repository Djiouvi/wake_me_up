
class StringUtils {

  static bool isNotBlank(String s) {
    return s.trim().isNotEmpty;
  }

  static bool isBlank(String s) {
    return !isNotBlank(s);
  }
}
