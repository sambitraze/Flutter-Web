import 'dart:ui';
import 'package:aarvi_web/linepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platform_detect/platform_detect.dart';
import 'package:websafe_platform/websafe_platform.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
     var websafePlatform = WebsafePlatform();
    if(websafePlatform.isAndroid()){
      setState(() {
        count = 2; 
      });
    }
    else{
      setState(() {
        count = 5;
      });
    }
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Live Tracking',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.tv),
              onPressed: () {
                setState(() {
                  count = 10;
                });
              }),
          IconButton(
              icon: Icon(Icons.laptop),
              onPressed: () {
                setState(() {
                  count = 5;
                });
              }),
          IconButton(
              icon: Icon(Icons.android),
              onPressed: () {
                setState(() {
                  count = 2;
                });
              }),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Line No wise Tracking',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: StreamBuilder(
                stream: Firestore.instance.collection('operation').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> lines =
                        snapshot.data.documents.last.data['lines'];
                    String documentId =
                        DateFormat('yyyyMMdd').format(DateTime.now());
                    lines.forEach((element) {
                      print('line no: '+element.toString());
                    });
                    return GridView.count(
                      crossAxisCount: count,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      children: lines
                          .map((e) => customlisttile(
                                context,
                                e,
                                int.tryParse(documentId),
                              ))
                          .toList(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          Text(operatingSystem.name.toString()),
        ],
      ),
    );
  }
}

Widget customlisttile(
  BuildContext context,
  int value,
  int did,
) {
  return StreamBuilder(
    stream: Firestore.instance
        .collection('operation')
        .document("$did")
        .collection("$value")
        .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasData) {
        snapshot.data.documents.forEach((element) {
          print('Doc id:' + element.documentID.toString());
        });

        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          elevation: 10.0,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LinePage(
                    lineno: value,
                  ),
                ),
              );
            },
            color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'line no $value',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 10.0),
                new Text(
                  'Online: ${snapshot.data.documents.where((element) => element.data['active'] == true).length}',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 10.0),
                new Text(
                  'Offline: ${snapshot.data.documents.where((element) => element.data['active'] == false).length}',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}
