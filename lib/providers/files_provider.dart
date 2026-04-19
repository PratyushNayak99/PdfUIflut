import 'package:flutter/foundation.dart';
import '../models/pdf_file.dart';

class FilesProvider with ChangeNotifier {
  List<PdfFile> _files = [
    PdfFile(
      id: '1',
      name: 'Product Design Guide.pdf',
      duration: '12 min',
      progress: 45,
    ),
    PdfFile(
      id: '2',
      name: 'Marketing Strategy 2026.pdf',
      duration: '8 min',
      progress: 100,
    ),
    PdfFile(
      id: '3',
      name: 'Annual Report.pdf',
      duration: '25 min',
      progress: 0,
    ),
    PdfFile(
      id: '4',
      name: 'User Research Insights.pdf',
      duration: '15 min',
      progress: 20,
    ),
    PdfFile(
      id: '5',
      name: 'Q1 Business Review.pdf',
      duration: '18 min',
      progress: 0,
    ),
    PdfFile(
      id: '6',
      name: 'Design System Guidelines.pdf',
      duration: '22 min',
      progress: 67,
    ),
  ];

  List<PdfFile> get files => _files;
  
  List<PdfFile> get recentFiles => _files.take(3).toList();

  void deleteFile(String id) {
    _files = _files.where((file) => file.id != id).toList();
    notifyListeners();
  }

  void addFile(PdfFile file) {
    _files.insert(0, file);
    notifyListeners();
  }

  void updateProgress(String id, int progress) {
    _files = _files.map((file) {
      if (file.id == id) {
        return file.copyWith(progress: progress);
      }
      return file;
    }).toList();
    notifyListeners();
  }
}
