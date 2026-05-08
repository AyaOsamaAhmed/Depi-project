class ServerException implements Exception {
  final String errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}
