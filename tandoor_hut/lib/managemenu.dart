import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ManageMenu extends StatefulWidget {
  @override
  _ManageMenuState createState() => _ManageMenuState();
}

class _ManageMenuState extends State<ManageMenu> {
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