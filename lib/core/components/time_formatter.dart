 import 'package:intl/intl.dart';

String formatDuration(Duration duration) {
    final DateTime dateTime = DateTime(0).add(duration);
    final DateFormat formatter = DateFormat('HH : mm : ss');
    return formatter.format(dateTime);
  }