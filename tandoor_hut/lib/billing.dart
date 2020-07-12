import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    color: Colors.black38,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Bill ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    color: Colors.black38,
                    ),
                    padding: EdgeInsets.all(12),
                    child: DigitalClock(
                      areaDecoration: BoxDecoration(
                        color: Colors.transparent
                      ),
                    ),
                  )
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/minilogo.png',
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                                Container(
                                  height: 100,
                                  width: 400,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Search Item',
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
                                    'Search',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  color: Colors.orange,
                                  padding: EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Icon(Icons.receipt, size: 100)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Text(
                              'Near SBI ATM Godhna Road Ara, Bhojpur,\nPhone Number - 9776999273',
                              textAlign: TextAlign.left,
                            ),
                          )
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
                            child: Container(
                              color: Colors.white,
                              child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Srl No',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Item',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Price',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                                rows: const <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('1')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('2')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('3')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('4')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('5')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('6')),
                                      DataCell(Text('Veg Biryani')),
                                      DataCell(Text('1')),
                                      DataCell(Text('150')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 500,
                                  alignment: Alignment.center,
                                  color: Colors.orange[400],
                                  child: Text(
                                    'Total Amount',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  height: 300,
                                  width: 350,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Text('Item Total'),
                                        trailing: Text('Rs 120'),
                                      ),
                                      ListTile(
                                        leading: Text('Packing'),
                                        trailing: Text('Rs 10'),
                                      ),
                                      ListTile(
                                        leading: Text('SGST'),
                                        trailing: Text('Rs 18'),
                                      ),
                                      ListTile(
                                        leading: Text('CGST'),
                                        trailing: Text('Rs 20'),
                                      ),
                                      ListTile(
                                        trailing: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                          ),
                                          child: Text('Rs 158'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 250,
                            alignment: Alignment.center,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Cashier Name',
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
                            height: 100,
                            width: 250,
                            alignment: Alignment.center,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Phone Number',
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
                              borderRadius: BorderRadius.circular(15)
                            ),
                            padding: EdgeInsets.all(8),
                            width: 200,
                            alignment: Alignment.center,
                            child: DropdownButton(
                              focusColor: Colors.white,
                              hint: Text('Payemnt Type'),                              
                              items: [
                                DropdownMenuItem(
                                  child: Text('Cash'),
                                ),
                                DropdownMenuItem(
                                  child: Text('UPI'),
                                ),
                              ],
                              onChanged: (value) => print(value),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () => print('sdadaf'),
                            child: Text(
                              'Print Bill',
                              style: TextStyle(fontSize: 22),
                            ),
                            color: Colors.orange,
                            padding: EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
