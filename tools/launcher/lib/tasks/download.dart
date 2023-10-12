import 'package:launcher/task.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class DownloadTask extends Task {
  final String url;
  final String path;

  DownloadTask({required this.url, required this.path}) : super("DL $url");

  @override
  Future<void> onRun() async {
    if (!(await File(path).exists())) {
      await Directory(dirname(path)).create(recursive: true);
      await _downloadFile(url, path, (progress) => this.progress = progress);
    }
  }

  Future<File> _downloadFile(
      String url, String savePath, Function(double) onProgress) async {
    final response =
        await http.Client().send(http.Request('GET', Uri.parse(url)));

    final contentLength = response.contentLength;
    final file = File(savePath);
    var byteCount = 0;

    final sink = file.openWrite();
    await for (var chunk in response.stream) {
      sink.add(chunk);
      byteCount += chunk.length;

      if (contentLength != null) {
        final downloadProgress = byteCount / contentLength;
        onProgress(downloadProgress);
      }
    }

    await sink.flush();
    await sink.close();

    return file;
  }
}
