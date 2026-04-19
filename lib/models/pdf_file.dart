class PdfFile {
  final String id;
  final String name;
  final String duration;
  final int progress;
  final String? filePath;

  PdfFile({
    required this.id,
    required this.name,
    required this.duration,
    this.progress = 0,
    this.filePath,
  });

  PdfFile copyWith({
    String? id,
    String? name,
    String? duration,
    int? progress,
    String? filePath,
  }) {
    return PdfFile(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
      filePath: filePath ?? this.filePath,
    );
  }
}
