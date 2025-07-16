class CreateUserEntity {
  const CreateUserEntity({
    required this.id,
    required this.email,
    this.userName,
    this.numberPhone,
    this.image,
  });
  final String id;
  final String email;
  final String? userName;
  final String? numberPhone;
  final String? image;
}
