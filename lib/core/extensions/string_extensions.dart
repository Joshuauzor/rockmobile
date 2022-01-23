class StringUtil {
  static String escapeSpecial(String query) {
    return query.replaceAllMapped(RegExp(r'[.*+?^${}()|[\]\\]'), (x) {
      return "\\${x[0]}";
    });
  }
}
