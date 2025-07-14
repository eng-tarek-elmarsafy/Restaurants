abstract interface class DataStorServices {
  Future<List<Map<String, dynamic>>> getData(
    String path, [
    String? column,
    String? restrctions,
  ]);
}
