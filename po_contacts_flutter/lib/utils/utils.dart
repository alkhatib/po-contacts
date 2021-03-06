import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:po_contacts_flutter/utils/remove_diacritics.dart';

class NormalizedString {
  final String sourceStr;
  String _normalizedStr;

  NormalizedString(this.sourceStr);

  String _getNormalizedStr() {
    if (_normalizedStr == null) {
      _normalizedStr = Utils.normalizeString(sourceStr);
    }
    return _normalizedStr;
  }

  String get normalized => _getNormalizedStr();

  bool contains(final String str) {
    return normalized.contains(str);
  }
}

class Utils {
  static String positiveNumberToXDigitsString(final int number, final int digitsCount) {
    return number.toString().padLeft(digitsCount, '0');
  }

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

  static bool stringEqualsIgnoreCase(final String str1, final String str2) {
    if (str1 == str2) {
      return true;
    }
    if (str1 != null && str2 != null) {
      return str1.toLowerCase() == str2.toLowerCase();
    } else {
      return false;
    }
  }

  static String getFileName(final String filePath) {
    if (filePath == null) {
      return '';
    }
    final List<String> filePathSplit = filePath.split('/');
    return filePathSplit[filePathSplit.length - 1];
  }

  static String getFileExtension(final String filePath) {
    final String fileName = getFileName(filePath);
    if (fileName == null) {
      return '';
    }
    final List<String> pathNameSplit = fileName.split('.');
    return '.' + pathNameSplit[pathNameSplit.length - 1];
  }

  static Future<bool> base64StringToFile(final String base64String, final File destFile) async {
    try {
      final Uint8List bytes = base64.decode(base64String);
      await destFile.writeAsBytes(bytes);
    } catch (e) {
      return false;
    }
    return true;
  }

  static Future<String> fileContentToBase64String(String filePath) async {
    try {
      final File sourceFile = File(filePath);
      if (!await sourceFile.exists()) {
        return null;
      }
      final Uint8List fileBytes = await sourceFile.readAsBytes();
      return base64.encode(fileBytes);
    } catch (e) {
      return null;
    }
  }

  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
