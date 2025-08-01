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
      creditPoints: fields[15] as int?,
      skills: (fields[16] as List?)?.cast<SkillApplication>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserObject obj) {
    writer
      ..writeByte(17)
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
      ..write(obj.trainingParticipates)
      ..writeByte(15)
      ..write(obj.creditPoints)
      ..writeByte(16)
      ..write(obj.skills);
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
      eventId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEventObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.eventId);
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

class SkillApplicationAdapter extends TypeAdapter<SkillApplication> {
  @override
  final int typeId = 22;

  @override
  SkillApplication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SkillApplication(
      id: fields[0] as int?,
      createdAt: fields[2] as DateTime?,
      description: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SkillApplication obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillApplicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserObject _$UserObjectFromJson(Map<String, dynamic> json) => UserObject(
      id: (json['id'] as num?)?.toInt(),
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
          : json['birthDate'] is String
              ? DateTime.parse(json['birthDate'] as String)
              : json['birthDate'] is DateTime
                  ? json['birthDate'] as DateTime
                  : DateTime.parse(json['birthDate'].toString()),
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
      creditPoints: (json['creditPoints'] as num?)?.toInt(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => SkillApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'loginName': instance.loginName,
      'password': instance.password,
      'email': instance.email,
      'birthDate': formatDate(instance.birthDate),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'newsLetter': instance.newsLetter,
      'role': instance.role,
      'externalId': instance.externalId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'todos': instance.todos,
      'eventParticipates': instance.eventParticipates,
      'trainingParticipates': instance.trainingParticipates,
      'creditPoints': instance.creditPoints,
      'skills': instance.skills,
    };

PushTokenObject _$PushTokenObjectFromJson(Map<String, dynamic> json) =>
    PushTokenObject(
      token: json['token'] as String?,
      apn: json['apn'] as bool?,
      hms: json['hms'] as bool?,
      fcm: json['fcm'] as bool?,
    );

Map<String, dynamic> _$PushTokenObjectToJson(PushTokenObject instance) =>
    <String, dynamic>{
      'token': instance.token,
      'apn': instance.apn,
      'hms': instance.hms,
      'fcm': instance.fcm,
    };

UserEventObject _$UserEventObjectFromJson(Map<String, dynamic> json) =>
    UserEventObject(
      id: (json['id'] as num?)?.toInt(),
      shortDescription: json['shortDescription'] as String?,
      name: json['name'] as String?,
      text: json['text'] as String?,
      eventId: (json['event']?['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserEventObjectToJson(UserEventObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'shortDescription': instance.shortDescription,
      'text': instance.text,
      if (instance.eventId != null) 'eventId': instance.eventId,
    };

UserTrainingObject _$UserTrainingObjectFromJson(Map<String, dynamic> json) =>
    UserTrainingObject(
      id: (json['id'] as num?)?.toInt(),
      trainingDate: json['trainingDate'] == null
          ? null
          : UserTrainingDateObject.fromJson(
              json['trainingDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserTrainingObjectToJson(UserTrainingObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainingDate': instance.trainingDate,
    };

UserTrainingDateObject _$UserTrainingDateObjectFromJson(
        Map<String, dynamic> json) =>
    UserTrainingDateObject(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserTrainingDateObjectToJson(
        UserTrainingDateObject instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SkillApplication _$SkillApplicationFromJson(Map<String, dynamic> json) =>
    SkillApplication(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SkillApplicationToJson(SkillApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _UserRestClient implements UserRestClient {
  _UserRestClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<UserObject>> filterGetAll({
    String? property,
    String? valueOfProperty,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      if (property != null) r'property': property,
      if (valueOfProperty != null) r'value': valueOfProperty,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserObject>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserObject> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => UserObject.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<int>?> getAllIds({bool onlyIds = true}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      if (onlyIds != null) r'onlyIds': onlyIds
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<int>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<int>? _value;
    try {
      _value = _result.data?.cast<int>();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Map<String, List<UserObject>>?> getAllSplit(int splitBy) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      if (splitBy != null) r'splitBy': splitBy
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Map<String, List<UserObject>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Map<String, List<UserObject>>? _value;
    try {
      _value = _result.data?.map((k, dynamic v) => MapEntry(
          k,
          (v as List)
              .map((i) => UserObject.fromJson(i as Map<String, dynamic>))
              .toList()));
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<UserObject>> getAll({
    int? pageById,
    DateTime? pageByDate,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      if (pageById != null) r'pageById': pageById,
      if (pageByDate != null) r'pageByDate': pageByDate,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserObject>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserObject> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => UserObject.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserObject> getOne(String id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserObject>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserObject _value;
    try {
      _value = UserObject.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserObject> update(
    String id,
    UserObject task,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _options = _setStreamType<UserObject>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserObject _value;
    try {
      _value = UserObject.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> delete(String id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<UserObject> post(UserObject task) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _options = _setStreamType<UserObject>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserObject _value;
    try {
      _value = UserObject.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PushTokenObject> postPushToken(
    String id,
    PushTokenObject task,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _options = _setStreamType<PushTokenObject>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/${id}/pushToken',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PushTokenObject _value;
    try {
      _value = PushTokenObject.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserObject> login(String basicLoginToken) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': basicLoginToken};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserObject>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/authenticate/login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserObject _value;
    try {
      _value = UserObject.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
