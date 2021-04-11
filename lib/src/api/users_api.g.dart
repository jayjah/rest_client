// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserObjectAdapter extends TypeAdapter<UserObject> {
  @override
  final int typeId = 11;

  @override
  UserObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserObject(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      createdAt: fields[11] as DateTime?,
      loginName: fields[3] as String?,
      password: fields[4] as String?,
      email: fields[5] as String?,
      birthDate: fields[6] as DateTime?,
      lastLogin: fields[7] as DateTime?,
      newsLetter: fields[8] as bool?,
      role: fields[9] as String?,
      externalId: fields[10] as String?,
      eventParticipates: (fields[13] as List?)?.cast<UserEventObject>(),
      todos: (fields[12] as List?)?.cast<TodoObject>(),
      trainingParticipates: (fields[14] as List?)?.cast<UserTrainingObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserObject obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.loginName)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.birthDate)
      ..writeByte(7)
      ..write(obj.lastLogin)
      ..writeByte(8)
      ..write(obj.newsLetter)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.externalId)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.todos)
      ..writeByte(13)
      ..write(obj.eventParticipates)
      ..writeByte(14)
      ..write(obj.trainingParticipates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PushTokenObjectAdapter extends TypeAdapter<PushTokenObject> {
  @override
  final int typeId = 12;

  @override
  PushTokenObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushTokenObject(
      token: fields[0] as String?,
      apn: fields[1] as bool?,
      hms: fields[2] as bool?,
      fcm: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PushTokenObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.apn)
      ..writeByte(2)
      ..write(obj.hms)
      ..writeByte(3)
      ..write(obj.fcm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushTokenObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserEventObjectAdapter extends TypeAdapter<UserEventObject> {
  @override
  final int typeId = 13;

  @override
  UserEventObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEventObject(
      id: fields[1] as int?,
      shortDescription: fields[2] as String?,
      name: fields[0] as String?,
      text: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEventObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEventObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTrainingObjectAdapter extends TypeAdapter<UserTrainingObject> {
  @override
  final int typeId = 14;

  @override
  UserTrainingObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTrainingObject(
      id: fields[0] as int?,
      trainingDate: fields[1] as UserTrainingDateObject?,
    );
  }

  @override
  void write(BinaryWriter writer, UserTrainingObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.trainingDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTrainingObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTrainingDateObjectAdapter
    extends TypeAdapter<UserTrainingDateObject> {
  @override
  final int typeId = 15;

  @override
  UserTrainingDateObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTrainingDateObject(
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserTrainingDateObject obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTrainingDateObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserObject _$UserObjectFromJson(Map<String, dynamic> json) {
  return UserObject(
    id: json['id'] as int?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    loginName: json['loginName'] as String?,
    password: json['password'] as String?,
    email: json['email'] as String?,
    birthDate: json['birthDate'] == null
        ? null
        : DateTime.parse(json['birthDate'] as String),
    lastLogin: json['lastLogin'] == null
        ? null
        : DateTime.parse(json['lastLogin'] as String),
    newsLetter: json['newsLetter'] as bool?,
    role: json['role'] as String?,
    externalId: json['externalId'] as String?,
    eventParticipates: (json['eventParticipates'] as List<dynamic>?)
        ?.map((e) => UserEventObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    todos: (json['todos'] as List<dynamic>?)
        ?.map((e) => TodoObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    trainingParticipates: (json['trainingParticipates'] as List<dynamic>?)
        ?.map((e) => UserTrainingObject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'loginName': instance.loginName,
      'password': instance.password,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'newsLetter': instance.newsLetter,
      'role': instance.role,
      'externalId': instance.externalId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'todos': instance.todos,
      'eventParticipates': instance.eventParticipates,
      'trainingParticipates': instance.trainingParticipates,
    };

PushTokenObject _$PushTokenObjectFromJson(Map<String, dynamic> json) {
  return PushTokenObject(
    token: json['token'] as String?,
    apn: json['apn'] as bool?,
    hms: json['hms'] as bool?,
    fcm: json['fcm'] as bool?,
  );
}

Map<String, dynamic> _$PushTokenObjectToJson(PushTokenObject instance) =>
    <String, dynamic>{
      'token': instance.token,
      'apn': instance.apn,
      'hms': instance.hms,
      'fcm': instance.fcm,
    };

UserEventObject _$UserEventObjectFromJson(Map<String, dynamic> json) {
  return UserEventObject(
    id: json['id'] as int?,
    shortDescription: json['shortDescription'] as String?,
    name: json['name'] as String?,
    text: json['text'] as String?,
  );
}

Map<String, dynamic> _$UserEventObjectToJson(UserEventObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
    };

UserTrainingObject _$UserTrainingObjectFromJson(Map<String, dynamic> json) {
  return UserTrainingObject(
    id: json['id'] as int?,
    trainingDate: json['trainingDate'] == null
        ? null
        : UserTrainingDateObject.fromJson(
            json['trainingDate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserTrainingObjectToJson(UserTrainingObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainingDate': instance.trainingDate,
    };

UserTrainingDateObject _$UserTrainingDateObjectFromJson(
    Map<String, dynamic> json) {
  return UserTrainingDateObject(
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$UserTrainingDateObjectToJson(
        UserTrainingDateObject instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserRestClient implements UserRestClient {
  _UserRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<UserObject>> filterGetAll({property, valueOfProperty}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (property != null) r'property': property,
                  if (valueOfProperty != null) r'value': valueOfProperty
                },
                extra: _extra)
            .compose(_dio.options, '/users',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<UserObject>> getAll(
      {pageById, pageByDate, splitBy, onlyIds, pageByIds}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserObject>>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate,
                  if (splitBy != null) r'splitBy': splitBy,
                  if (onlyIds != null) r'onlyIds': onlyIds,
                  if (pageByIds != null) r'pageByIds': pageByIds
                },
                extra: _extra)
            .compose(_dio.options, '/users',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserObject> getOne(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserObject>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserObject> update(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserObject>(
            Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/users/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<UserObject> post(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PushTokenObject> postPushToken(id, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PushTokenObject>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users/$id/pushToken',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PushTokenObject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserObject> login(basicLoginToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserObject>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': basicLoginToken},
                extra: _extra)
            .compose(_dio.options, '/authenticate/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserObject.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
