import 'package:restaurants/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.isEmailVerified,
    super.image,
    super.numberPhone,
    super.userName,
  });

  factory UserModel.fromResponse(AuthResponse respons) {
    return UserModel(
      id: respons.user!.id,
      email: respons.user!.email!,
      isEmailVerified: respons.session != null,
      userName: respons.user!.userMetadata?['userName'],
      numberPhone: respons.user!.userMetadata?['numberPhone'],
      image: respons.user!.userMetadata?['image'],
    );
  }
}
