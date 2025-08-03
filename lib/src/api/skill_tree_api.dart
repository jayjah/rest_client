import 'package:dart_backend_client/dart_backend_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

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
