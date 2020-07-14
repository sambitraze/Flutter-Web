// showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//                                             title: Text('Proccesing'),
//                                             content: Container(
//                                               height: 100,
//                                               width: 100,
//                                               child:
//                                                   Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 35),
//                                                     child: LinearProgressIndicator(

//                                                     ),
//                                                   ),
//                                             ),
//                                           ),
//                                         );

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DemoPrint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

var storage = FirebaseStorage.instance;

demop() async {
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
  StorageTaskSnapshot snapshot =
      await storage.ref().child("images/bill1").putFile(file).onComplete;
  if (snapshot.error == null) {
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    await Firestore.instance
        .collection("bills")
        .add({"url": downloadUrl, "name": 'bill1'});
  }
}
