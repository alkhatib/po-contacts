class I18nString {
  final String app_name = 'app_name';
  final String create_new_contact = 'create_new_contact';
  final String export_all_as_vcf = 'export_all_as_vcf';
  final String about = 'about';
  final String about_message = 'about_message';
  final String ok = 'ok';
  final String new_contact = 'new_contact';
  final String edit_contact = 'edit_contact';
}

class I18n {
  static final I18nString string = new I18nString();

  static Map<String, String> currentTranslation = {
    string.app_name: 'PO Contacts',
    string.create_new_contact: 'Create new contact',
    string.export_all_as_vcf: 'Export all as VCF file',
    string.about: 'About (v%s)',
    string.about_message: 'About message here',
    string.ok: 'OK',
    string.new_contact: 'New contact',
    string.edit_contact: 'Edit contact',
  };

  static _getObjString(final Object _obj) {
    if (_obj == null) {
      return '';
    }
    return _obj.toString();
  }

  static _getStringWithReplacement(
      final String _sourceStr, final int _strIndex, final int _replacedLength, final Object _replacementObj) {
    return _sourceStr.substring(0, _strIndex) +
        _getObjString(_replacementObj) +
        _sourceStr.substring(_strIndex + _replacedLength, _sourceStr.length);
  }

  static getString(final String _stringKey, [final Object _param1, final Object _param2, final Object _param3]) {
    String resString = I18n.currentTranslation[_stringKey];
    if (resString == null) {
      return _stringKey;
    }
    int foundIndex = resString.indexOf('%s');
    if (foundIndex > -1) {
      resString = _getStringWithReplacement(resString, foundIndex, 2, _param1);
    }
    foundIndex = resString.indexOf('%1\$d');
    if (foundIndex == -1) {
      foundIndex = resString.indexOf('%1\$s');
    }
    if (foundIndex > -1) {
      resString = _getStringWithReplacement(resString, foundIndex, 4, _param1);
    }
    foundIndex = resString.indexOf('%2\$d');
    if (foundIndex == -1) {
      foundIndex = resString.indexOf('%2\$s');
    }
    if (foundIndex > -1) {
      resString = _getStringWithReplacement(resString, foundIndex, 4, _param2);
    }
    foundIndex = resString.indexOf('%3\$d');
    if (foundIndex == -1) {
      foundIndex = resString.indexOf('%3\$s');
    }
    if (foundIndex > -1) {
      resString = _getStringWithReplacement(resString, foundIndex, 4, _param3);
    }
    return resString;
  }
}
