class User {
  final String? id;
  final String nome;
  final String email;
  final String avatarUrl;

  User(
      {this.id,
      required this.nome,
      required this.email,
      required this.avatarUrl});
}
