// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageObjectAdapter extends TypeAdapter<MessageObject> {
  @override
  final int typeId = 6;

  @override
  MessageObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageObject(
      id: fields[0] as int,
      title: fields[1] as String,
      message: fields[2] as String,
      htmlMessage: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MessageObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.htmlMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageObject _$MessageObjectFromJson(Map<String, dynamic> json) {
  return MessageObject(
    id: json['id'] as int,
    title: json['title'] as String,
    message: json['message'] as String,
    htmlMessage: json['htmlMessage'] as String,
  );
}

Map<String, dynamic> _$MessageObjectToJson(MessageObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'htmlMessage': instance.htmlMessage,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MessageRestClient implements MessageRestClient {
  _MessageRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MessageObject> postMessageForUser(userId, task) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/users/$userId/sendMessage',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<MessageObject> postNewsletterMessage(task) async {
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/newsletters',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageObject.fromJson(_result.data);
    return value;
  }

  @override
  Future<MessageObject> postPushMessage(id, task) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(task, 'task');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/pushmessage/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageObject.fromJson(_result.data);
    return value;
  }
}
