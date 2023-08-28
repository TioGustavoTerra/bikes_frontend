import 'package:bikes_frontend/componentes/Dropped_file.dart';
import 'package:flutter/material.dart';

class DropzoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropzoneWidget({
    Key? key,

    required this.onDroppedFile,
  }) : super(key: Key);

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    final colorBackground = isHighlighted ? Colors.blue : Colors.green;
    final colorButton = isHighlighted ? Colors.blue.shade300 : Colors.green.shade300;

    return Container(
        color: colorBackground,
        child: Stack(
          children: [
            DropzoneView(
                onCreated: (controller) => this.controller = controller,
                onHover: () => StepState(() => isHighlighted = true),
                onLeave: () => StepState(() => isHighlighted = false),
                onDrop: acceptFile,
                ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_upload, size: 80, color: Colors.white),
                const Text(
                  'Drop files',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(),
                        primary: colorButton,
                        shape: RoundedRectangleBorder()),
                    onPressed: () async {
                      final events = await controller.pickFiles();
                      if (events.isEmpty) return;

                      acceptFile(events.firts);
                    },
                    icon: const Icon(Icons.search, size: 32),
                    label: const Text(
                      'Choose Files',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ))
              ],
            )),
          ],
        ));
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name $name');
    print('Mime: $mime');
    print('Bytes: $bytes');
    print('Url: $url');

    final droppedFile = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    widget.onDroppedFile(droppedFile);
    setState(() => isHighlighted = false);
  }
}
