part of xlsio;

/// Class used for describing DecimalSeparatorToken.
class _DecimalPointToken extends _FormatTokenBase {
  /// Format character.
  static const String _defaultFormat = '.';

  /// Applies format to the value.
  @override
  String _applyFormat(double value, bool bShowHiddenSymbols,
      CultureInfo culture, _FormatSection section) {
    return _strFormat;
  }

  /// Tries to parse format string.
  @override
  int _tryParse(String strFormat, int iIndex) {
    final int iFormatLength = strFormat.length;

    if (iFormatLength == 0) {
      throw 'strFormat - string cannot be empty';
    }

    if (iIndex < 0 || iIndex > iFormatLength - 1) {
      throw 'iIndex - Value cannot be less than 0 and greater than than format length - 1.';
    }

    final String chCurrent = strFormat[iIndex];

    if (chCurrent == _defaultFormat) {
      iIndex++;
      _strFormat = chCurrent;
    } else if (strFormat[iIndex] == r'\\' &&
        strFormat[iIndex + 1] == _defaultFormat) {
      // ignore: noop_primitive_operations
      _strFormat = strFormat[iIndex + 1].toString();
      iIndex = iIndex + 2;
    }
    return iIndex;
  }

  /// Applies format to the value.
  @override
  // ignore: unused_element
  String _applyFormatString(String value, bool bShowHiddenSymbols) {
    return '';
  }

  /// Gets type of the token. Read-only.
  @override
  _TokenType get _tokenType {
    return _TokenType.decimalPoint;
  }
}
