part of dart_backend_client;

/// Basic model interface
abstract class DataModel {
  int? id;
}

abstract class CalendarDate {
  DateTime? get date;
}
