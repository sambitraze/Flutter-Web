import 'package:flutter/material.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
                    child: Image.asset(
                      'assets/dashboard.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                 Container(
            height: double.infinity,
            width: double.infinity,
                    color: Colors.white60,
                  ), 
                  Container(
                    alignment: Alignment.center,
child: Image.asset('assets/con.png',height: 500,fit: BoxFit.cover,),
                  )

        ],
      ),
    );
  }
}