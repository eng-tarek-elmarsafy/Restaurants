import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  factory UserModel.fromEntity(UserEntity entit) {
    return UserModel(
      fullName: entit.fullName,
      phon: entit.phon,
      id: entit.id,
      address: entit.address,
      avtarUrl: entit.avtarUrl,
    );
  }
  UserModel({
    super.id,
    required super.fullName,
    required super.phon,
    super.avtarUrl,
    super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      fullName: data['full_name'],
      phon: data['phon'],
      id: data['id'],
      address: data['address'],
      avtarUrl: data['avtar_url'],
    );
  }
  toJson() {
    return {
      'full_name': fullName,
      'phone': phon,
      'id': id,
      'address': address,
      'avatar_url': avtarUrl,
    };
  }
}
