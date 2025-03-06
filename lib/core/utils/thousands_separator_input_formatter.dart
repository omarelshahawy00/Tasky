import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,###", "en_US");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Parse the new input value
    final int selectionIndex = newValue.selection.end;
    final String digitsOnly = newValue.text.replaceAll('.', '');
    final String formattedValue = numberFormat.format(int.parse(digitsOnly));

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: selectionIndex + (formattedValue.length - digitsOnly.length),
      ),
    );
  }
}
