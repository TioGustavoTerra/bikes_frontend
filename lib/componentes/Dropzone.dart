import 'package:bikes_frontend/componentes/Dropped_file.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropzoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropzoneWidget({
    Key? key,
    required this.onDroppedFile,
  }) : super(key: key);

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    final colorBackground = isHighlighted ? Colors.blue : Colors.green;
    final colorButton =
        isHighlighted ? Colors.blue.shade300 : Colors.green.shade300;

    return buildDecoration(
        child: Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onHover: () => setState(() => isHighlighted = true),
          onLeave: () => setState(() => isHighlighted = false),
          onDrop: acceptFile,
          // onDropMultiple: (value) {
          //   print(value);
          // },
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload, size: 80, color: Colors.white),
            const Text(
              'Solte arquivos aqui',
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

                  acceptFile(events.first);
                },
                icon: const Icon(Icons.search, size: 32),
                label: const Padding(
                  padding: EdgeInsets.only(right: 15,),
                  child: Text(
                    'Procurar',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ))
          ],
        )),
      ],
    ));
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = isHighlighted ? Colors.blue : Colors.green;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: colorBackground,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          strokeWidth: 3,
          padding: EdgeInsets.zero,
          dashPattern: const [8, 4],
          radius: const Radius.circular(10),
          child: child,
        ),
      ),
    );
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
