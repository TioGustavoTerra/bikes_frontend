class DroppedFile {
  final String url;
  final String name;
  final String mime;
  final int bytes;
  final String base64Image;

  DroppedFile({
    required this.url,
    required this.name,
    required this.mime,
    required this.bytes,
    required this.base64Image,
  });
}
