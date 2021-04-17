class ConduitException implements Exception {
  ConduitException(this.message, [this.fieldErrors]);

  final String message;
  final Map<String, String>? fieldErrors;

  @override
  String toString() => 'ConduitException($message)';
}
