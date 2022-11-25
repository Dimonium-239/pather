import 'package:envied/envied.dart';

part 'env.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
@Envied()
abstract class Env {

  @EnviedField(varName: "GOOGLE_WEB_ID")
  static const String googleWebId = _Env.googleWebId;
}