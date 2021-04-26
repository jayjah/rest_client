import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../dart_backend_client.dart';

part 'credits_api.g.dart';

@RestApi(autoCastResponse: true)
abstract class CreditRestClient implements RestInterface<CreditObject> {
  factory CreditRestClient(Dio dio, {String? baseUrl}) = _CreditRestClient;

  @GET("/credits/{id}")
  Future<CreditObject?> getOne(@Path("id") String id);

  @GET("/credits")
  Future<List<int>?> getAllIds({@Header('onlyIds') bool onlyIds = true});

  @GET("/credits")
  Future<Map<String, List<CreditObject>>?> getAllSplit(
      @Header('splitBy') int splitBy);

  @GET("/credits")
  Future<List<CreditObject>?> getAll({
    @Header("pageById") int? pageById,
    @Header('pageByDate') DateTime? pageByDate,
    //    @Header('splitBy') int? splitBy,
    //     @Header('onlyIds') bool? onlyIds,
//      @Header('pageByIds') List<int>? pageByIds,
  });

  @PUT("/credits/{id}")
  Future<CreditObject?> update(
      @Path('id') String id, @Body() CreditObject task);

  @DELETE("/credits/{id}")
  Future<void> delete(@Path('id') String id);

  @POST("/credits")
  Future<CreditObject?> post(@Body() CreditObject task);

  @POST("/users/{userId}/credits/{creditId}")
  Future<CreditObject?> userEarnedCredits(
      @Path('userId') String userId, @Path('creditId') String creditId);
}

@HiveType(typeId: 7)
@JsonSerializable()
class CreditObject extends HiveObject implements DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? value;
  @HiveField(2)
  String? type;

  CreditObject({this.id, this.value, this.type});

  factory CreditObject.fromJson(Map<String, dynamic> json) =>
      _$CreditObjectFromJson(json);
  Map<String, dynamic> toJson() => _$CreditObjectToJson(this);

  @override
  int get hashCode => id.hashCode ^ runtimeType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditObject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value &&
          type == other.type;

  @override
  String toString() =>
      '${this.runtimeType}(value: "$value",id: $id,type: $type)';
}
