import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInitializing {
  static Future<void> initializing() async {
    await Supabase.initialize(
      url: 'https://ngzkhpjctpjtjmcfuiri.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5nemtocGpjdHBqdGptY2Z1aXJpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE1MzY1ODQsImV4cCI6MjA2NzExMjU4NH0.aX_D9E2l-Z0tw9o6AUsSRa9yQVgLGg7OrsayIt_jTRM',
    );
  }
}
