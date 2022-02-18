import 'package:intl/intl.dart';

class TimeFmt {
  static String getOnlyDate(String timeString) {
    DateTime date = DateTime.parse(timeString);
    var formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
}
