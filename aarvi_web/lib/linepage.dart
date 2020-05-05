import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:platform_detect/platform_detect.dart';
import 'package:websafe_platform/websafe_platform.dart';
class LinePage extends StatefulWidget {
  LinePage({this.lineno});

  final int lineno;

  @override
  _LinePageState createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
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
        count = 4;
      });
    }
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
                  count = 2;
                });
              }),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Line no: ',
                style: TextStyle(fontSize: 28.0),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                elevation: 10.0,
                child: Container(
                  color: Colors.yellowAccent,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.lineno.toString(),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('operation')
                      .document(DateFormat('yyyyMMdd').format(DateTime.now()))
                      .collection(widget.lineno.toString())
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    var totalitemCount = 0;
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> worker = snapshot.data.documents;
                      
                      totalitemCount = worker.length;
                      print('total doc:' + totalitemCount.toString());
                      return GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: count,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: worker.map((e) => customlisttile(e)).toList(),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ),
          Text(operatingSystem.name.toString()),
        ],
      ),
    );
  }
}

Widget customlisttile(DocumentSnapshot e) {
  Color bg = Colors.white;
  if (e['active']) {
    bg = Colors.greenAccent;
  } else {
    bg = Colors.redAccent;
  }
  print(e['uid'].toString()+' Is Active:'+e['active'].toString());
  return Card(
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
    elevation: 10.0,
    child: Container(
      color: bg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'UID: ' + e['uid'].toString(),
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            'Name: ' + e['name'],
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            'Operation ' + e['operation'],
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            'Time In: ' + DateFormat.Hms().format(e['time_in'].toDate()),
            style: TextStyle(fontSize: 24.0),
          ),
          e['time_out'] == null
          ? SizedBox(height: 10,)
          : Text(
            'Time Out: ' + DateFormat.Hms().format(e['time_out'].toDate()),
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    ),
  );
}
