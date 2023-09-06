import 'package:intl/intl.dart';

String formatPrice(int price) {
  return NumberFormat.decimalPatternDigits().format(price).replaceAll(',', ' ');
}
