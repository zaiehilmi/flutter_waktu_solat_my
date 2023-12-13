import 'package:intl/intl.dart';

String formatMasa(String masa) {
  final format = DateFormat.jm();
  final formatted = format.format(DateFormat('HH:mm:ss').parse(masa));

  return formatted;
}
