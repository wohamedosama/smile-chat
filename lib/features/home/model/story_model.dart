class StoryModel {
  final String image;
  final String name;
  final bool? isViwed;
  const StoryModel({
    required this.image,
    required this.name,
    this.isViwed = false,
  });
}
