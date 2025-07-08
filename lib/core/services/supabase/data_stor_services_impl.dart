import 'package:restaurants/core/services/data_stor_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DataStorServicesImpl implements DataStorServices {
  var supabase = Supabase.instance.client;

  @override
  Future<List<Map<String, dynamic>>> getData(String path) async {
    var respons = await supabase.from(path).select();

    return respons;
  }
}
