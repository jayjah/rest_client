import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'users_api.dart';

part 'skill_tree_api.g.dart';

@RestApi()
abstract class SkillTreeClient {
  factory SkillTreeClient(Dio dio, {String? baseUrl}) = _SkillTreeClient;

  @POST("/users/skills/{id}")
  Future<SkillApplication?> postSkill(
    @Path('id') int userId,
    @Header('skillId') String skillId,
  );
}
