import 'package:bikes_frontend/componentes/Dropped_file.dart';
import 'package:flutter/material.dart';

class DroppedFileWidget extends StatelessWidget {
  final DroppedFile? file;

  const DroppedFileWidget({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(),
          if (file != null) buildFileDetails(file!),
        ],
      );

  Widget buildImage() {
    if (file == null) return buildEmptyFile('No file');

    return Image.network(
      file!.url,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
      errorBuilder: (Context, error, _) => buildEmptyFile('No Preview'),
    );
  }

  Widget buildEmptyFile(String text) => Container(
        width: 120,
        height: 120,
        color: Colors.blue.shade300,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget buildFileDetails(DroppedFile file) {
    final style = TextStyle(fontSize: 20);

    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(file.name, style: style.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text(file.mime, style: style,),
          const SizedBox(height: 8,),
          Text(file.size, style: style,)
        ],
      ),
    );
  }
}
