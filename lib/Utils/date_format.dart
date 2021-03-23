import 'package:intl/intl.dart';

String formatAsDDMMYYYY(DateTime dateTime) {
  return DateFormat("dd/MM/yyyy").format(dateTime.toLocal()).split(' ')[0];
}