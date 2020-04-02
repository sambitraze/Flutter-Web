import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 1000.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.redAccent,
                    Colors.orangeAccent,
                    Colors.orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // ],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(60.0),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 60.0,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(height: 370),
                  Text(
                    'Decoders',
                    style: TextStyle(
                      fontSize: 180.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Eat . Sleep. Code . Repeat',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 500.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.redAccent,
                    Colors.orangeAccent,
                    Colors.orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // ],
                borderRadius: BorderRadius.all(
                  Radius.circular(60.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
