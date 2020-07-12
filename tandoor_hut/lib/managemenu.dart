import 'package:flutter/material.dart';

class ManageMenu extends StatefulWidget {
  @override
  _ManageMenuState createState() => _ManageMenuState();
}

class _ManageMenuState extends State<ManageMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/dashboard.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 100,
          right: 100,
          top: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    'Manage\nMenu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container()
                ],
              ),
            ),
            Divider(
              indent: 05,
              endIndent: 20,
              height: 10,
              thickness: 5,
              color: Colors.white,
            ),
            Expanded(
              child: Card(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Color.fromRGBO(206, 206, 206, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100,
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Item Name',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(8),
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: DropdownButton(
                                    focusColor: Colors.white,
                                    hint: Text('Menu Type'),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Starters'),
                                      ),
                                      DropdownMenuItem(
                                        child: Text('UPI'),
                                      ),
                                    ],
                                    onChanged: (value) => print(value),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.all(8),
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: DropdownButton(
                                    focusColor: Colors.white,
                                    hint: Text('v/nv'),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Veg'),
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Non-Veg'),
                                      ),
                                    ],
                                    onChanged: (value) => print(value),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.money_off),
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Price',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () => print('sdadaf'),
                                  child: Text(
                                    'Add Item',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  color: Colors.orange,
                                  padding: EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Icon(Icons.local_dining, size: 100)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(50.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Tandoor',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Main Course',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Chinese Main Course',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Rice/Biryani',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(50.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Noodles',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Breads',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Rolls na Momos',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 300,
                                        alignment: Alignment.center,
                                        color: Colors.orange[400],
                                        child: Text(
                                          'Salads & and Raita',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 450,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                            Text('asfsf'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
