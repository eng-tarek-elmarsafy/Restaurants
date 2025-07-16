class UserEntity {
  UserEntity({
    this.id,
    required this.fullName,
    required this.phon,
    this.avtarUrl,
    this.address,
  });

  final String? id;
  final String fullName;
  final String phon;
  final String? avtarUrl;
  final String? address;
}
