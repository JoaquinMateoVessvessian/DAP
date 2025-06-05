class Usuarios {
  String name;
  String username;
  String mail;
  String password;

  Usuarios({
    required this.name,
    required this.username,
    required this.mail,
    required this.password,
  });

  @override
  String toString() {
    return 'Usuarios{name: $name, username: $username, mail: $mail, password: $password}';
  }
}