import 'package:intl/intl.dart';

extension Stringext on String {
  String formatDate(DateTime date) {
    var locale = 'id_ID';
    var format = DateFormat.yMMMMd(locale);
    String formattedDate = format.format(date);
    return formattedDate;
  }
}