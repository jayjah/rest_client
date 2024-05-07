import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'trainings_api.g.dart';

@RestApi()
abstract class TrainingsRestClient implements RestInterface<TrainingsObject> {
  factory TrainingsRestClient(Dio dio, {String? baseUrl}) =
      _TrainingsRestClient;

  @override
  @GET("/trainings")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/trainings")
  Future<Map<String, List<TrainingsObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/trainings")
  Future<List<TrainingsObject>> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //   @Header('splitBy') int? splitBy,
    //  @Header('onlyIds') bool? onlyIds,
    // @Header('pageByIds') List<int>? pageByIds},
  });

  @override
  @GET("/trainings/{id}")
  Future<TrainingsObject> getOne(@Path('id') String id);

  @override
  @PUT("/trainings/{id}")
  Future<TrainingsObject> update(
      @Path('id') String id, @Body() TrainingsObject task);

  @override
  @DELETE("/trainings/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/trainings")
  Future<TrainingsObject> post(@Body() TrainingsObject task);
}

@HiveType(typeId: 18)
@JsonSerializable()
class TrainingsObject extends HiveObject
    implements DataModel, ImageData, DetailData {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? shortDescription;
  @HiveField(2)
  String? text;
  @override
  @HiveField(3)
  int? id;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  @HiveField(6)
  ImageObject? image;
  @HiveField(7)
  TrainerObject? trainer;
  @HiveField(8)
  int? ageTill;
  @HiveField(9)
  int? ageFrom;
  @HiveField(10)
  String? weekDay;
  @HiveField(11)
  DateTime? lastCreatedTrainingDates;
  @HiveField(12)
  DateTime? timeFrom;
  @HiveField(13)
  DateTime? timeTill;
  @HiveField(14)
  bool? isAg;
  @HiveField(15)
  LocationObject? location;
  @HiveField(16)
  String? color;

  TrainingsObject({
    this.id,
    this.name,
    this.shortDescription,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.trainer,
    this.ageFrom,
    this.ageTill,
    this.weekDay,
    this.lastCreatedTrainingDates,
    this.timeFrom,
    this.timeTill,
    this.isAg,
    this.location,
    this.color,
  });

  @override
  int? get imageId => image?.id;

  String ageAsString() {
    if (ageFrom == null ||
        ageTill == null ||
        (ageFrom == 0 && ageTill == 100)) {
      return '';
    }

    final String locale = Intl.getCurrentLocale();
    final StringBuffer buffer = StringBuffer();
    if (ageFrom != 0) {
      if (ageTill == 100) {
        if (locale == 'de') {
          buffer.write('ab');
        } else {
          buffer.write('from');
        }
        buffer.write(' ');
      }
      buffer.write('$ageFrom ');
    }
    if (ageTill != 100 && ageTill != 99) {
      // 100 means that there is no end bound from server; 99 means that there is no end bound from client
      buffer.write('- $ageTill ');
    }

    if (buffer.isNotEmpty) {
      if (locale == 'de') {
        buffer.write('Jahre');
      } else {
        buffer.write('years');
      }
    }

    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingsObject &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          text == other.text &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          image == other.image &&
          trainer == other.trainer &&
          ageTill == other.ageTill &&
          ageFrom == other.ageFrom &&
          weekDay == other.weekDay &&
          lastCreatedTrainingDates == other.lastCreatedTrainingDates &&
          timeFrom == other.timeFrom &&
          timeTill == other.timeTill &&
          isAg == other.isAg &&
          location == other.location &&
          color == other.color;

  @override
  int get hashCode =>
      name.hashCode ^
      shortDescription.hashCode ^
      text.hashCode ^
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      image.hashCode ^
      trainer.hashCode ^
      ageTill.hashCode ^
      ageFrom.hashCode ^
      weekDay.hashCode ^
      lastCreatedTrainingDates.hashCode ^
      timeFrom.hashCode ^
      timeTill.hashCode ^
      isAg.hashCode ^
      location.hashCode ^
      color.hashCode;

  factory TrainingsObject.fromJson(Map<String, dynamic> json) =>
      _$TrainingsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingsObjectToJson(this);

  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,shortDescription: $shortDescription,text: $text,weekDay: $weekDay,ageFrom: $ageFrom,ageTill: $ageTill,location: $location, image: $image,trainer: $trainer,timeFrom: ${timeFrom?.toIso8601String()},timeTill: ${timeTill?.toIso8601String()},createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()}, color: $color)';

  @override
  String? get content => text;

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => '$name${isAg == true ? '   AG' : ''}';

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader => shortDescription;

  @override
  String? get youtubeUrl => null;

  bool get isParkourTraining {
    return (header?.toLowerCase().contains('parkour') ?? false) ||
        (subHeader?.toLowerCase().contains('parkour') ?? false);
  }

  bool get isBreakdanceTraining {
    return (header?.toLowerCase().contains('break') ?? false) ||
        (subHeader?.toLowerCase().contains('break') ?? false);
  }
}
