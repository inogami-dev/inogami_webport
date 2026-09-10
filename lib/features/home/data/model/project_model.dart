/// Used in Project Cards inside the Projects Section
class MyProjectModel {
  final String title;
  final String shortDescription;
  final String fullDescription;
  final List<String>? images;
  final List<String>? techStackImages;

  const MyProjectModel({
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    this.images,
    this.techStackImages,
  });
}
