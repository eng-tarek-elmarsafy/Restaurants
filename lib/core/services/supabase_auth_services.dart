// import 'dart:developer';

// import 'package:supabase_flutter/supabase_flutter.dart';

// abstract class SupabaseAuthEmailServices {
//   Future<User> signUpWithEmail(
//     String email,
//     String password,
//     String numberPhone,
//     String userName,
//   );
// }

// class SupabaseAuthEmailServicesImpl implements SupabaseAuthEmailServices {
//   final supabase = Supabase.instance.client;

//   @override
//   Future<User> signUpWithEmail(
//     String email,
//     String password,
//     String numberPhone,
//     String userName,
//   ) async {
//     AuthResponse respons = await supabase.auth.signUp(
//       email: email,
//       password: password,
//       data: {'numberPhone': numberPhone, 'userName': userName},
//     );
//   }


// }
