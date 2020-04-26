import 'dart:ui';
import 'package:aarvi_web/linepage.dart';
import 'package:flutter/material.dart';
import 'package:platform_detect/platform_detect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 5;
  

  @override
  Widget build(BuildContext context) {
    if (operatingSystem.name.toString() == 'Linux'){
      setState(() {
        count = 6;  
      });
    }
    return new Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(operatingSystem.name.toString()),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LinePage(
                                lineno: index.toString(),
                              ),
                            ),
                          );
                        },
                        color: Colors.amberAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'line $index',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            new Text(
                              'Online $index',
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            new Text(
                              'Offline $index',
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
        ],
      ),
    );
  }
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
