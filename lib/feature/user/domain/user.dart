// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class User {
  abstract final int remoteId;
  abstract final int? localId;

  /// Фамилия, Имя
  String get fullName;
}

class ActionExecutor implements User {
  @override
  final String fullName;

  @override
  final int? localId;

  @override
  final int remoteId;

  const ActionExecutor({
    this.localId,
    required this.remoteId,
    required this.fullName,
  });
}

class AllowedUser implements User {
  @override
  final String fullName;

  @override
  final int? localId;

  final String? avatarRemotePath;

  final String? avatarLocalPath;

  @override
  final int remoteId;

  const AllowedUser({
    required this.fullName,
    this.localId,
    required this.remoteId,
    this.avatarRemotePath,
    this.avatarLocalPath,
  });
}
