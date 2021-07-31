library dart_backend_client;

import 'dart:convert';
import 'dart:io';

import 'package:dart_backend_client/src/api/credits_api.dart';
import 'package:dart_backend_client/src/api/events_api.dart';
import 'package:dart_backend_client/src/api/feedbacks_api.dart';
import 'package:dart_backend_client/src/api/image_api.dart';
import 'package:dart_backend_client/src/api/locations_api.dart';
import 'package:dart_backend_client/src/api/messages_api.dart';
import 'package:dart_backend_client/src/api/news_api.dart';
import 'package:dart_backend_client/src/api/newsletters_api.dart';
import 'package:dart_backend_client/src/api/registers_api.dart';
import 'package:dart_backend_client/src/api/todos_api.dart';
import 'package:dart_backend_client/src/api/trainers_api.dart';
import 'package:dart_backend_client/src/api/training_days_api.dart';
import 'package:dart_backend_client/src/api/users_api.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

import 'src/api/configs_api.dart';
import 'src/api/trainings_api.dart';

export 'package:dio/dio.dart';
export 'package:hive/hive.dart';

export 'src/api/configs_api.dart';
export 'src/api/credits_api.dart';
export 'src/api/events_api.dart';
export 'src/api/extended_user_api.dart';
export 'src/api/feedbacks_api.dart';
export 'src/api/files_api.dart';
export 'src/api/image_api.dart';
export 'src/api/locations_api.dart';
export 'src/api/messages_api.dart';
export 'src/api/news_api.dart';
export 'src/api/newsletters_api.dart';
export 'src/api/participate_events_api.dart';
export 'src/api/participate_trainings_api.dart';
export 'src/api/registers_api.dart';
export 'src/api/status_api.dart';
export 'src/api/todos_api.dart';
export 'src/api/trainers_api.dart';
export 'src/api/training_days_api.dart';
export 'src/api/trainings_api.dart';
export 'src/api/users_api.dart';

part 'src/client.dart';
part 'src/exception.dart';
part 'src/helpers/file_upload_parser.dart';
part 'src/helpers/formatting.dart';
part 'src/interceptors/auth_token.dart';
part 'src/interfaces/data_model.dart';
part 'src/interfaces/rest_interface.dart';
part 'src/mock_dio.dart';

Future<void> initLocales(List<String> locales) async {
  for (final locale in locales) {
    await initializeDateFormatting(locale);
  }
}

void initModels() {
  // initialize datetime format
  Hive
    ..registerAdapter(ConfigObjectAdapter())
    ..registerAdapter(CreditObjectAdapter())
    ..registerAdapter(EventObjectAdapter())
    ..registerAdapter(FeedbackObjectAdapter())
    ..registerAdapter(ImageObjectAdapter())
    ..registerAdapter(LocationObjectAdapter())
    ..registerAdapter(MessageObjectAdapter())
    ..registerAdapter(NewsObjectAdapter())
    ..registerAdapter(NewsletterObjectAdapter())
    ..registerAdapter(RegisterObjectAdapter())
    ..registerAdapter(TodoObjectAdapter())
    ..registerAdapter(TrainerObjectAdapter())
    ..registerAdapter(TrainingDateObjectAdapter())
    ..registerAdapter(TrainingsObjectAdapter())
    ..registerAdapter(UserObjectAdapter())
    ..registerAdapter(PushTokenObjectAdapter())
    ..registerAdapter(UserTrainingDateObjectAdapter())
    ..registerAdapter(UserEventObjectAdapter())
    ..registerAdapter(UserTrainingObjectAdapter());
}

abstract class StorageRepository<T> {
  void safe(T data);

  T read();
}

/*
TODO add following as pull request to retrofit generator
                  if (pageById != null) r'pageById': pageById,
                  if (pageByDate != null) r'pageByDate': pageByDate,
                  if (splitBy != null) r'splitBy': splitBy,
                  if (onlyIds != null) r'onlyIds': onlyIds,
                  if (pageByIds != null) r'pageByIds': pageByIds
 */
