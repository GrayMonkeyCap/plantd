import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class Pdfreport {
  final pdf = pw.Document();

  var description;

  var diseasename;

  var remedy;

  var image;
  Future<int> generatepdf(diseasename, description, remedy, image) async {
    final image1 = pw.MemoryImage(
      File(image).readAsBytesSync(),
    );
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(children: [
          pw.Container(
            child: pw.Image(image1),
          ),
          pw.Text('Disease'),
          pw.Text(diseasename),
          pw.Text('Description'),
          pw.Text(description),
          pw.Text('Remedy'),
          pw.Text(remedy),
        ]),
      ),
    );
    final output = (await getApplicationDocumentsDirectory()).path;
    print(output);

    final file = File("${output}/report.pdf");

    await file.writeAsBytes(await pdf.save());
    return 1;
  }
}
