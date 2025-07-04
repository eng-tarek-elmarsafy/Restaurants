class UserEntity {
  const UserEntity({
    required this.id,
    required this.email,
    this.userName,
    this.numberPhone,
    this.image,
    required this.isEmailVerified,
  });
  final String id;
  final String email;
  final String? userName;
  final String? numberPhone;
  final String? image;
  final bool isEmailVerified;
}
