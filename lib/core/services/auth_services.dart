import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthServices {
  Future<User> signUpWithEmail(
    String email,
    String password,
    String numberPhone,
    String userName,
  );
  Future<User> signInWithEmail(String email, String password);

  Future<void> forgotPassword(String email);

  // Future<void> signOut();

  // Future<User> getCurrentUser();

  // Future<void> sendEmailVerification();

  // Future<void> sendPasswordResetEmail(String email);

  // Future<bool> isEmailVerified();

  // Future<void> updatePassword(String newPassword);

  // Future<void> updateEmail(String newEmail);

  Future<void> updateUserData(Map<String, dynamic> data);

  // Future<void> updatePhoneNumber(String newPhoneNumber);

  // Future<void> updateProfileImage(String imageUrl);

  // Future<void> updateCoverImage(String imageUrl);

  // Future<void> deleteAccount();

  // Future<void> updateDisplayName(String displayName);

  // Future<void> updatePhotoUrl(String photoUrl);
}
