class StoriesModel {
  final String image;
  final String name;
  final bool? isViwed;
  StoriesModel({
    required this.image,
    required this.name,
    this.isViwed = false,
  });
}
