part of dart_backend_client;

/// Basic model interface
abstract class DataModel {
  int? id;
}

abstract class CalendarDate {
  DateTime? get date;
}

abstract class DetailData {
  String? get header;
  String? get subHeader;
  String? get content;
  String? get youtubeUrl;
  String? get homepageLink;
  String? get homepageLinkName;
  DateTime? get createdDate;
}

abstract class ImageData {
  int? get imageId;
}

abstract class ImagesData {
  List<int?>? get imageIds;
}
