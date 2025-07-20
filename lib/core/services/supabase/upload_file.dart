import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class UploadFileServices {
  Future<String> uploadFile(path, File imageFile) async {
    var supabase = Supabase.instance.client;
    var fileName = p.basename(imageFile.path);
    // var fileExtension = p.extension(imageFile.path);

    await supabase.storage.from(path).upload('$path/$fileName', imageFile);
    var url = supabase.storage.from(path).getPublicUrl('$path/$fileName');

    return url;
  }
}
