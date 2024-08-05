import 'package:intl/intl.dart';

extension TimeExtension on DateTime {
  String get toformattedDate {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }
}
