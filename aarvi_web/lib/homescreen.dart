import 'dart:ui';
import 'package:aarvi_web/linepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platform_detect/platform_detect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 2;


  @override
  Widget build(BuildContext context) {
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
//              child: GridView.count(
//                mainAxisSpacing: 20,
//                crossAxisSpacing: 20,
//                crossAxisCount: count,
//                children: List.generate(
//                  30,
//                  (index) {
//                    return new Card(
//                      shape: RoundedRectangleBorder(
//                          borderRadius: new BorderRadius.circular(10.0)),
//                      elevation: 10.0,
//                      child: MaterialButton(
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => LinePage(lineno: index,),
//                            ),
//                          );
//                        },
//                        color: Colors.amberAccent,
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            new Text(
//                              'line $index',
//                              style: TextStyle(
//                                fontSize: 24.0,
//                              ),
//                            ),
//                            SizedBox(height: 10.0),
//                            new Text(
//                              'Online $index',
//                              style: TextStyle(
//                                fontSize: 24.0,
//                              ),
//                            ),
//                            SizedBox(height: 10.0),
//                            new Text(
//                              'Offline $index',
//                              style: TextStyle(
//                                fontSize: 24.0,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    );
//                  },
//                ),
//              ),
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('operation')
                    .snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData){
                    List<dynamic> lines = snapshot.data.documents[0].data['lines'];
                    String documentId = snapshot.data.documents[0].documentID;
                    lines.forEach((element) {print(element);});
                    return ListView(
                      children: lines.map((e) => customlisttile(context, e, int.tryParse(documentId))).toList(),
                    );
                  }
                  else{
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

Widget customlisttile(BuildContext context,int value,int did) {
  return StreamBuilder(
    stream: Firestore.instance.collection('operation').document("$did").collection("$value").snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasData){
        print(did);
        print(value);
        snapshot.data.documents.forEach((element) {print(element.documentID);});
        return Card(
                          shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      elevation: 10.0,
                      child: MaterialButton(
                        onPressed: () {
                        },
                        color: Colors.amberAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'line $value',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            new Text(
                              'Online ${snapshot.data.documents.where((element) => element.data['active']==true).length}',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            new Text(
                              'Offline ${snapshot.data.documents.where((element) => element.data['active']==false).length}',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
      }
      else{
        return CircularProgressIndicator();
      }
    },
  );
}
// Container(
//                 padding: const EdgeInsets.all(20),
//                 color: Colors.teal[100],
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Text('Line 10'),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Total operators: '),
//                           SizedBox(width: 10.0),
//                           Text('no'),
//                         ],
//                       )
//                     ]),
//               ),
