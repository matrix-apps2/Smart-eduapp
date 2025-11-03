import '../../../utils/translations/strings.dart';
import 'package:easy_localization/easy_localization.dart';

//? Add Duration(hours: 3) to all dates to fix timezone issue
class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm').format(dateTime);
  }

  static String formatTime(DateTime? dateTime) {
    if (dateTime == null) return "";
    return DateFormat('hh:mm').format(dateTime);
  }

  static String dayName(DateTime dateTime) {
    return DateFormat('EE').format(dateTime);
  }

  static String day(DateTime dateTime) {
    return DateFormat('dd').format(dateTime);
  }

  static String estimatedDate(DateTime? dateTime) {
    if (dateTime == null) return "";
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String slotDate(DateTime? dateTime) {
    if (dateTime == null) return "";
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String? dayInWeekOrDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    if (dateTime.isBefore(DateTime.now().add(const Duration(days: 7)))) {
      //check if its older than yesterday
      if (dateTime.isBefore(DateTime.now().subtract(const Duration(days: 7)))) {
        return DateFormat('dd MMM yyyy').format(dateTime);
      }
      //check if today
      //check if its yesterday
      if (dateTime.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        return DateFormat('dd MMM yyyy').format(dateTime);
      }
      //check if today
      if (dateTime.isBefore(DateTime.now().add(const Duration(days: 0)))) {
        return Strings().today;
      }
      //check if tomorrow
      if (dateTime.isBefore(DateTime.now().add(const Duration(days: 1)))) {
        return Strings().tomorrow;
      }

      return DateFormat('EEEE').format(dateTime);
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  static String stringToDate(String birthDate) {
    DateTime? date = DateTime.tryParse(birthDate);
    if (date == null) return "";
    return DateFormat('dd MMM yyyy').format(date.add(const Duration(hours: 3)));
  }

  static DateTime stringToDateTime(String birthDate) {
    DateTime date = DateTime.parse(birthDate).add(const Duration(hours: 3));
    return date;
  }

  static bool isSameDay(DateTime e, DateTime selectedDate) {
    return e.day == selectedDate.day &&
        e.month == selectedDate.month &&
        e.year == selectedDate.year;
  }
}
