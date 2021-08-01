part of dart_backend_client;

final DateFormat _defaultBirthDateFormat = DateFormat(
  'yyyy-MM-dd',
  'DE',
);
String? formatDate(DateTime? date) =>
    date == null ? null : _defaultBirthDateFormat.format(date);

final DateFormat _defaultDateFormat = DateFormat(
  'yyyy-MM-dd HH:mm:ss',
  'DE',
);
final DateFormat _displayDateFormat = DateFormat(
  'dd.MM.yy HH:mm',
  'DE',
);
String? formatDateTime(DateTime? dateTime) =>
    dateTime == null ? null : _defaultDateFormat.format(dateTime);

String? formatDisplayDateTime(DateTime? dateTime) =>
    dateTime == null ? null : _displayDateFormat.format(dateTime);

final DateFormat timeFormat = DateFormat(
  'HH:mm:ss',
  'DE',
);
String? formatTime(DateTime? time) =>
    time == null ? null : timeFormat.format(time);
