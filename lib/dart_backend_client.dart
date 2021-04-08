library dart_backend_client;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

export 'src/api/configs_api.dart';
export 'src/api/credits_api.dart';
export 'src/api/events_api.dart';
export 'src/api/feedbacks_api.dart';
export 'src/api/image_api.dart';
export 'src/api/locations_api.dart';
export 'src/api/messages_api.dart';
export 'src/api/news_api.dart';
export 'src/api/newsletters_api.dart';
export 'src/api/participate_events_api.dart';
export 'src/api/participate_trainings_api.dart';
export 'src/api/registers_api.dart';
export 'src/api/todos_api.dart';
export 'src/api/trainers_api.dart';
export 'src/api/trainings_api.dart';
export 'src/api/users_api.dart';

part 'src/client.dart';
part 'src/exception.dart';
part 'src/interceptors/auth_token.dart';
