abstract interface class StorServices {
  Future<List<Map<String, dynamic>>> getData(
    String path, [
    String? column,
    String? restrctions,
  ]);
}
