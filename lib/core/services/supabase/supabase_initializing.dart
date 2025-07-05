import 'package:restaurants/constrains.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInitializing {
  static Future<void> initializing() async {
    await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseAnonKey);
  }
}
