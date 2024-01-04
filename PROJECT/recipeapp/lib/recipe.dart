class Recipe {
  final String title;
  final String description;
  final List<String> comments;

  const Recipe({
    required this.title,
    required this.description,
    this.comments = const [],
  });
}
