import 'package:flutter/material.dart';
import 'package:aarvi_web/database.dart';
import 'package:platform_detect/platform_detect.dart';

class LinePage extends StatefulWidget {
  LinePage({this.lineno});
  final int lineno;

  @override
  _LinePageState createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  int count = 2;
  bool working = true;
  bool offline = true;

  @override
  Widget build(BuildContext context) {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              
              Text(
                'Line no: ' + (widget.lineno.toString()),
                style: TextStyle(fontSize: 28.0),
              )
            ]),
            Text(DatabaseService().workerCollection.toString()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: count,
                  children: List.generate(
                    30,
                    (index) {
                      return new Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        elevation: 10.0,
                        child: MaterialButton(
                          onPressed: () {},
                          color: offline ? Colors.redAccent : working ? Colors.greenAccent : Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                'Worker $index',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              new Text(
                                'name $index',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              new Text(
                                'operation $index',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              new Text(
                                'tot $index',
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
