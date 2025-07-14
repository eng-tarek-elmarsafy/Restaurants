import 'package:restaurants/core/services/data_stor_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class DataStorServicesImpl implements DataStorServices {
//   var supabase = Supabase.instance.client;

//   @override
//   Future<List<Map<String, dynamic>>> getData(
//     String path, [
//     String? column,
//     String? restrctions,
//   ]) async {
//     List<Map<String, dynamic>> respons = [{}];
//     var requst = supabase.from(path);

//     if (column == null) {
//       respons = await requst.select();
//     }
//     if (column != null) {
//       respons = await requst.select(column).eq(column, restrctions!);
//     }

//     return respons;
//   }
// }

class DataStorServicesImpl implements DataStorServices {
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
}

