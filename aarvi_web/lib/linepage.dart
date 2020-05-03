import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:platform_detect/platform_detect.dart';

class LinePage extends StatefulWidget {
  LinePage({this.lineno});

  int lineno;

  @override
  _LinePageState createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  int count = 1;
  bool working = true;
  bool offline = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //to dynamically change colour

    // if(intime.hasdata) {
    //   setState(() {
    //     offline = false;
    //   });
    //   if(outtime.hasdata){
    //     setState(() {
    //       working = false;
    //     });
    //   }

    // }

    return Scaffold(
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
                  count = 8;
                });
              }),
          IconButton(
              icon: Icon(Icons.laptop),
              onPressed: () {
                setState(() {
                  count = 4;
                });
              }),
          IconButton(
              icon: Icon(Icons.android),
              onPressed: () {
                setState(() {
                  count = 1;
                });
              }),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                'Line no: ' + (widget.lineno.toString()),
                style: TextStyle(fontSize: 28.0),
              )
            ]),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('operation')
                        .document(DateFormat('yyyyMMdd').format(DateTime.now()))
                        .collection(widget.lineno.toString())
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasData){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Active"),
                            Column(
                              children: snapshot
                                  .data
                                  .documents
                                  .where((element) => element['active'] == true)
                                  .map((e) =>
                                  Text(e['name']))
                                  .toList(),
                            ),
                            Text("Not Active"),
                            Column(
                              children: snapshot
                                  .data
                                  .documents
                                  .where((element) => element['active'] == false)
                                  .map((e) => Card(
                                child: Text(e['name']),))
                                  .toList(),
                            )
                          ],
                        );
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    } ,
                  ),
                ),
              ),
            ),
            Text(operatingSystem.name.toString()),
          ],
        ),
      ),
    );
  }
}