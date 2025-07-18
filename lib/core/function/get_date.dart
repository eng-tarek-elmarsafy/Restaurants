import 'package:intl/intl.dart';

String getDate(String date) {
  final localDateTime = DateTime.parse(date).toLocal();
  String formatted = DateFormat('yyyy/MM/dd - hh:mm a').format(localDateTime);
  return formatted;
}
