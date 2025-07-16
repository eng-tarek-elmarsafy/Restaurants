import 'package:restaurants/features/auth/domain/entities/create_user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateUserModel extends CreateUserEntity {
  CreateUserModel({
    required super.id,
    required super.email,
    super.image,
    super.numberPhone,
    super.userName,
  });

  factory CreateUserModel.fromUser(User user) {
    return CreateUserModel(
      id: user.id,
      email: user.email!,
      userName: user.userMetadata?['userName'],
      numberPhone: user.userMetadata?['numberPhone'],
      image: user.userMetadata?['image'],
    );
  }
}
