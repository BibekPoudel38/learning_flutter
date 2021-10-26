class ListModel {
  final String? profilePicture;
  final String? username;
  final String? date;
  final String? message;
  final bool seen;

  ListModel({
    this.profilePicture,
    this.username,
    this.date,
    this.message,
    required this.seen,
  });
}
