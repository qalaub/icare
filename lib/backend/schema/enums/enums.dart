import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum UsersRolsEnum {
  user,
  professional,
}

enum Roles {
  user,
  profesional,
  business,
}

enum Plan {
  basic,
  standar,
  premiun,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UsersRolsEnum):
      return UsersRolsEnum.values.deserialize(value) as T?;
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (Plan):
      return Plan.values.deserialize(value) as T?;
    default:
      return null;
  }
}
