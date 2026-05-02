class Session {
  final String sessionId;
  final String userId;
  final String refreshToken;
  final String deviceFingerprint;
  final DateTime createdAt;
  final bool isRevoked;

  const Session({
    required this.sessionId,
    required this.userId,
    required this.refreshToken,
    required this.deviceFingerprint,
    required this.createdAt,
    required this.isRevoked,
  });
}