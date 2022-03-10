import 'dart:io';
import 'package:flutter/material.dart';
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
        build: (pw.Context context) =>
            pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Center(
            child: pw.Image(image1),
          ),
          pw.Text('Disease:',
              textAlign: pw.TextAlign.left,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 30)),
          pw.Text(diseasename,
              textAlign: pw.TextAlign.justify,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 25)),
          pw.Text('Description:',
              textAlign: pw.TextAlign.left,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 30)),
          pw.Text(description,
              textAlign: pw.TextAlign.justify,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 25)),
          pw.Text('Remedy:',
              textAlign: pw.TextAlign.left,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 30)),
          pw.Text(remedy,
              textAlign: pw.TextAlign.justify,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 25)),
        ]),
      ),
    );
    // final output = (await getApplicationDocumentsDirectory()).path;
    Directory? externalDirectory = await getExternalStorageDirectory();
    // print(output);
    //getExternalFilesDir()
    print(externalDirectory);
    final file = File(externalDirectory!.path + "/report.pdf");

    await file.writeAsBytes(await pdf.save());
    //   material.Navigator.of(context).push(
    //   material.MaterialPageRoute(
    //     builder: (_) => PdfViewerPage(path: path),
    //   ),
    // );
    return 1;
  }
}
