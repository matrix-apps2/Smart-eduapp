import 'package:easy_localization/easy_localization.dart';

class TypeConverter {
  //convert String to dateTime
  static DateTime? stringToDateTime(String? date) {
    if (date == null) {
      return null;
    }
    return DateTime.parse(date);
  }

  static String dateTimeToString(DateTime? dateTime, {DateTimeFormat? format}) {
    if (dateTime == null) return "";
    if (format == DateTimeFormat.date) {
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
    if (format == DateTimeFormat.ddMMyyyyHHmm) {
      String formattedDate = DateFormat('dd MMM hh:mm a').format(dateTime);
      return formattedDate;
    }
    if (format == DateTimeFormat.time) {
      return "${dateTime.hour}:${dateTime.minute}";
    }
    return dateTime.toString();
  }

  static String stringDateTimeToString(String? dateTime,
      {DateTimeFormat? format}) {
    DateTime? date = stringToDateTime(dateTime);
    if (date == null) return "";
    return dateTimeToString(date, format: format);
  }
}

enum DateTimeFormat { date, time, ddMMyyyyHHmm }
