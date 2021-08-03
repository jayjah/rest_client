import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';
import 'image_api.dart';

part 'events_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class EventRestClient implements RestInterface<EventObject> {
  factory EventRestClient(Dio dio, {String? baseUrl}) = _EventRestClient;

  @GET("/events")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/events")
  Future<Map<String, List<EventObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/events")
  Future<List<EventObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //   @Header('splitBy') int? splitBy,
    //  @Header('onlyIds') bool? onlyIds,
    //  @Header('pageByIds') List<int>? pageByIds,
  });

  @GET("/events/{id}")
  Future<EventObject?> getOne(@Path("id") String id);

  @PUT("/events/{id}")
  Future<EventObject?> update(@Path('id') String id, @Body() EventObject task);

  @DELETE("/events/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/events")
  Future<EventObject?> post(@Body() EventObject task);
}

@HiveType(typeId: 3)
@JsonSerializable()
class EventObject extends HiveObject
    implements DataModel, CalendarDate, DetailData, ImageData {
  @HiveField(0)
  int? id;
  @override
  @HiveField(1)
  String? youtubeUrl;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? wordPressId;
  @HiveField(4)
  String? text;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? shortDescription;
  @HiveField(7)
  DateTime? createdAt;
  @HiveField(8)
  DateTime? updatedAt;
  @HiveField(9)
  ImageObject? image;
  @override
  @HiveField(10)
  String? homepageLink;
  @HiveField(11)
  DateTime? startDate;
  @HiveField(12)
  DateTime? endDate;

  EventObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.youtubeUrl,
      this.title,
      this.wordPressId,
      this.homepageLink,
      this.startDate,
      this.endDate,
      this.text});

  String get startEndAsString => startDate == null || endDate == null
      ? ''
      : '${simpleTimeFormat.format(startDate!)} - ${DateFormat('HH:mm   dd.MM.yyyy', 'DE').format(endDate!)}';

  @override
  int? get imageId => image?.id;

  @override
  DateTime? get date => startDate;

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          startDate == other.startDate &&
          endDate == other.endDate;

  factory EventObject.fromJson(Map<String, dynamic> json) =>
      _$EventObjectFromJson(json);
  Map<String, dynamic> toJson() => _$EventObjectToJson(this);

  @override
  String toString() =>
      '${this.runtimeType}(id: $id,name: $name,title: $title,shortDescription: $shortDescription,text: $text,startDate: ${startDate?.toIso8601String()},createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()},endDate: ${endDate?.toIso8601String()})';

  @override
  String? get content => text;

  @override
  String? get header => name;

  @override
  String? get subHeader => shortDescription;

  @override
  DateTime? get createdDate => createdAt;
}
