import 'dart:ui';
import 'package:aarvi_web/linepage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 5,
            children: List.generate(
              30,
              (index) {
                return new Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  elevation: 10.0,
                  child: MaterialButton(
                    onPressed: () {
                      LinePage();
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
            )),
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
