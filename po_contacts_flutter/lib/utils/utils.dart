import 'package:po_contacts_flutter/utils/remove_diacritics.dart';

class Utils {
  static String normalizeString(final String sourceString) {
    if (sourceString == null) {
      return '';
    }
    return removeDiacritics(sourceString).toLowerCase();
  }

  static int stringCompare(final String str1, final String str2) {
    if (str1 == null && str2 == null) {
      return 0;
    }
    if (str1 == null) {
      return -1;
    }
    if (str2 == null) {
      return -1;
    }
    final String lstr1 = str1.toLowerCase();
    final String lstr2 = str2.toLowerCase();
    final int lCompare = lstr1.compareTo(lstr2);
    if (lCompare == 0) {
      return str1.compareTo(str2);
    } else {
      return lCompare;
    }
  }
}
