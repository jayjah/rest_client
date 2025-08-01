import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:retrofit/retrofit.dart';

part 'locations_api.g.dart';

@RestApi()
abstract class LocationRestClient implements RestInterface<LocationObject> {
  factory LocationRestClient(Dio dio, {String? baseUrl}) = _LocationRestClient;

  @override
  @GET("/locations")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @override
  @GET("/locations")
  Future<Map<String, List<LocationObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @override
  @GET("/locations")
  Future<List<LocationObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //  @Header('splitBy') int? splitBy,
    //   @Header('onlyIds') bool? onlyIds,
    //   @Header('pageByIds') List<int>? pageByIds,
  });

  @override
  @GET("/locations/{id}")
  Future<LocationObject?> getOne(@Path("id") String id);

  @override
  @PUT("/locations/{id}")
  Future<LocationObject?> update(
      @Path('id') String id, @Body() LocationObject task);

  @override
  @DELETE("/locations/{id}")
  Future<void> delete(@Path('id') String id);

  @override
  @POST("/locations")
  Future<LocationObject?> post(@Body() LocationObject task);
}

@HiveType(typeId: 5)
@JsonSerializable()
class LocationObject extends HiveObject
    implements DataModel, DetailData, ImageData, ImagesData {
  @HiveField(0)
  num? longitude;
  @HiveField(1)
  num? latitude;
  @HiveField(2)
  String? city;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String? postalCode;
  @HiveField(5)
  String? name;
  @override
  @HiveField(6)
  int? id;
  @HiveField(7)
  String? shortDescription;
  @HiveField(8)
  String? text;
  @HiveField(9)
  DateTime? createdAt;
  @HiveField(10)
  DateTime? updatedAt;
  @HiveField(11)
  ImageObject? image;
  @HiveField(12)
  List<ImageObject>? images;
  LocationObject(
      {this.id,
      this.name,
      this.shortDescription,
      this.text,
      this.latitude,
      this.longitude,
      this.address,
      this.city,
      this.postalCode,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.images});

  @override
  int? get imageId => image?.id;

  @override
  List<int?>? get imageIds =>
      images?.map((ImageObject? e) => e?.id).toList()?..add(imageId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationObject &&
          runtimeType == other.runtimeType &&
          longitude == other.longitude &&
          latitude == other.latitude &&
          city == other.city &&
          address == other.address &&
          postalCode == other.postalCode &&
          name == other.name &&
          id == other.id &&
          shortDescription == other.shortDescription &&
          text == other.text &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          image == other.image &&
          images == other.images;

  @override
  int get hashCode =>
      longitude.hashCode ^
      latitude.hashCode ^
      city.hashCode ^
      address.hashCode ^
      postalCode.hashCode ^
      name.hashCode ^
      id.hashCode ^
      shortDescription.hashCode ^
      text.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      image.hashCode ^
      images.hashCode;

  factory LocationObject.fromJson(Map<String, dynamic> json) =>
      _$LocationObjectFromJson(json);
  factory LocationObject.fromPlace(Place place) {
    final addressDetails = place.address;
    if (addressDetails == null) {
      return LocationObject();
    }
    //print('LocationObject :: ADDRESSDETAILS :. $addressDetails');
    final city = addressDetails['city'] as String? ??
        addressDetails['town'] as String? ??
        addressDetails['village'] as String? ??
        addressDetails['state'] as String?;
    final street = addressDetails['road'] as String?;
    final houseNumber = addressDetails['house_number'] as String?;
    final latitude = place.lat;
    final longitude = place.lon;
    final shortDescription = addressDetails['suburb'] as String? ??
        addressDetails['city_district'] as String?;
    final postalCode = addressDetails['postcode']?.toString();
    return LocationObject(
      postalCode: postalCode,
      city: city,
      latitude: latitude,
      longitude: longitude,
      name: place.displayName,
      address: '${street ?? ''} ${houseNumber ?? ''}',
      shortDescription: shortDescription,
    );
  }
  Map<String, dynamic> toJson() => _$LocationObjectToJson(this);

  static Future<Iterable<LocationObject>> fromQuery(String pattern) async {
    final locations = await Nominatim(userAgent: '').searchByName(
      query: pattern,
      limit: 5,
      addressDetails: true,
      extraTags: false,
      nameDetails: true,
    );
    return locations.map(
      (e) => LocationObject.fromPlace(e),
    );
  }

  static Future<LocationObject> fromLatLong(
      double latitude, double longitude) async {
    final location = await Nominatim(userAgent: '').reverseSearch(
      lon: longitude,
      lat: latitude,
      addressDetails: true,
      extraTags: false,
      nameDetails: true,
    );
    return LocationObject.fromPlace(location);
  }

  @override
  String toString() =>
      '$runtimeType(id: $id,name: $name,city: $city,address: $address,postalCode: $postalCode,latitude: $latitude,text: $text,longitude: $longitude,createdAt: ${createdAt?.toIso8601String()},updatedAt: ${updatedAt?.toIso8601String()}, image: $image, images:${images?.map((e) => e.toJson())})';

  @override
  String? get content => shortDescription;

  @override
  DateTime? get createdDate => createdAt;

  @override
  String? get header => name;

  @override
  String? get homepageLink => null;

  @override
  String? get homepageLinkName => null;

  @override
  String? get subHeader =>
      '${address ?? ''}\n${postalCode ?? ''} ${city ?? ''}';

  @override
  String? get youtubeUrl => null;
}
