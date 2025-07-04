import 'package:restaurants/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    super.image,
    super.numberPhone,
    super.userName,
  });

  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email!,
      userName: user.userMetadata?['userName'],
      numberPhone: user.userMetadata?['numberPhone'],
      image: user.userMetadata?['image'],
    );
  }
}
