import 'package:intl/intl.dart';

class TimeFmt {
  static String getOnlyDate(String timeString) {
    DateTime date = DateTime.parse(timeString);
    var formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }
}
