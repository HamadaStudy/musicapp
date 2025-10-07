import 'dart:io';

import 'package:client/core/constants/server_constat.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<void> uploadSong(File selectedImage, File selectedAudio) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstat.serverURL}/song/upload'),
    );

    request
      ..files.addAll([
        await http.MultipartFile.fromPath('song', selectedAudio.path),
        await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
      ])
      ..fields.addAll({
        'artist': 'Taylor',
        'song_name': 'Whoosh',
        'hex_code': 'FFFFFF',
      })
      ..headers.addAll({
        'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjgyMGEzNDcwLTllYTktNDA5Zi05ZTA5LTQ5ZDRmNTNkZWYyYiJ9.BKIv3rPvIj-tTa2y_P6_8PSgT-Tjs-j6MQ26uHwg7IU',
      });
    final res = await request.send();
    print(res);
  }
}
