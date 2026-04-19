import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../providers/files_provider.dart';
import '../components/phone_frame.dart';
import '../components/file_item.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filesProvider = context.watch<FilesProvider>();
    final files = filesProvider.files;

    return PhoneFrame(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Library',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Files count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${files.length} ${files.length == 1 ? "file" : "files"}',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Files list
          Expanded(
            child: files.isEmpty
                ? _EmptyLibrary(theme: theme)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.separated(
                      itemCount: files.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return FileItem(
                          file: file,
                          onPlay: () {
                            context.push('/player');
                          },
                          onDelete: () {
                            filesProvider.deleteFile(file.id);
                            Fluttertoast.showToast(
                              msg: 'File deleted successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _EmptyLibrary extends StatelessWidget {
  final ThemeData theme;

  const _EmptyLibrary({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.description_rounded,
              size: 40,
              color: theme.colorScheme.primary.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No files yet',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Upload a PDF to get started!',
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
