import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/theme/thema.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  final artistController = TextEditingController();
  final songNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Song')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: const Radius.circular(10),
                color: Pallete.borderColor,
                dashPattern: [10, 4],
                strokeCap: StrokeCap.round,
              ),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 40),
                    const SizedBox(height: 15),
                    Text(
                      'Select the thumnail for your song',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomField(
              hintText: 'Pick Song',
              controller: null,
              readOnly: true,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            CustomField(hintText: 'Artist', controller: artistController),
            const SizedBox(height: 20),
            CustomField(hintText: 'Song Name', controller: songNameController),
          ],
        ),
      ),
    );
  }
}
