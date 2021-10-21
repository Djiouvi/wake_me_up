import 'package:intl/intl.dart';

import 'stringUtils.dart';

class DateUtilsBja {
  static const String TIME_FORMAT = 'hh:mm';
  static const String DATE_FORMAT = 'dd:MM:yyyy';

  static DateFormat getDateFormat(String format) {
    return new DateFormat(format);
  }

  static String dateTimeToString(DateTime? dateTime, String defaultFormat) {
    return StringUtils.isNotBlank(defaultFormat) ? getDateFormat(defaultFormat).format(dateTime!) : getDateFormat(DATE_FORMAT).format(dateTime!);
  }
}
