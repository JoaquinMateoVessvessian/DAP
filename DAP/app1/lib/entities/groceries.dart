class Groceries {
  final String title;
  final String photo;
  final String description;

  Groceries({
    required this.title,
    required this.photo,
    required this.description,
  });

  @override
  String toString() {
    return 'Groceries{title: $title, password: $photo, description: $description}';
  }
}
