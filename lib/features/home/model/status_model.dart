class StatusModel {
  final String image;
  final String name;
  final bool? isViwed;
  const StatusModel({
    required this.image,
    required this.name,
    this.isViwed = false,
  });
}
