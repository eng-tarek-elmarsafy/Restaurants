import 'package:restaurants/core/services/stor_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorServicesImpl implements StorServices {
  final supabase = Supabase.instance.client;

  @override
  Future<List<Map<String, dynamic>>> getData(
    String path, [
    String? filterColumn,
    String? restriction,
  ]) async {
    List<Map<String, dynamic>> response = [];

    final request = supabase.from(path);

    if (filterColumn != null && restriction != null) {
      response = await request.select().eq(filterColumn, restriction);
    } else {
      response = await request.select();
    }

    return response;
  }

  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await supabase.from(path).insert(data);
  }
}
