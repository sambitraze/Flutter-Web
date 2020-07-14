import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

create(){

  final doc = pw.Document();

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll57,
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final file = File('example.pdf');
  file.writeAsBytesSync(doc.save());
}