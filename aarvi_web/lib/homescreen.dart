import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50.0),
          child: GridView.count(
            primary: false,
            // padding: const EdgeInsets.all(100),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 1'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 2'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 3'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 4'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 5'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 6'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 7'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 8'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 9'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.teal[100],
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Line 10'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total operators: '),
                          SizedBox(width: 10.0),
                          Text('no of operator'),
                        ],
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
