import '../storag_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoragServicesImpl extends StoragServices {
  final supabase = Supabase.instance.client;
  @override
  Future<void> deleteFile(String path, List<String> imageUrl) async {
    await supabase.storage.from(path).remove(imageUrl);
  }
}
