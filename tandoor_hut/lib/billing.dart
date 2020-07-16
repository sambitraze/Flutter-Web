import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
// import 'package:universal_html/prefer_universal/html.dart' as html;
// import 'package:firebase/firebase.dart' as fb;

final menuItemColRef = Firestore.instance.collection('MenuItems');
final billColRef = Firestore.instance.collection('BillList');
final FirebaseStorage storage = FirebaseStorage.instance;

// StorageUploadTask _uploadTask;

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  String type;
  bool loading = false;
  TextEditingController customer = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  String cashier = 'Example name';
  List itemList = [];
  List srlno = [];
  bool load = false;
  int srl = 1;
  List<int> quant = [];
  List priceunit = [];
  List amount = [];
  List<DataRow> rowList = [];
  int billno = 0;

  double itemsum = 0;
  double packing = 0;
  double gstper = 0.00;
  double gstCharge = 0.0;
  double grandtot = 0.0;

  additemtotal(double val, double quanti) {
    setState(() {
      itemsum += val;
      gstCharge = itemsum * gstper;
      grandtot = gstCharge + packing + itemsum;
    });
  }

  @override
  void initState() {
    super.initState();
    billColRef.document('info').get().then(
      (value) {
        setState(() {
          billno = value.data['takeid'];
          print('got1' + billno.toString());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/dashboard.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          Container(
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
                        padding: EdgeInsets.all(8),
                        width: 175,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Invoice',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 2,
                              endIndent: 20,
                              indent: 10,
                            )
                          ],
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15),
                        //   color: Colors.black38,
                        // ),
                        padding: EdgeInsets.all(12),
                        child: DigitalClock(
                          areaDecoration:
                              BoxDecoration(color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
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
                          height: 210,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        controller: itemName,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.search),
                                          focusColor: Colors.white,
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Search Item',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 200,
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        controller: quantity,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          focusColor: Colors.white,
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Quantity',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          loading = true;
                                        });
                                        menuItemColRef
                                            .where("Item_Name",
                                                isEqualTo: itemName.text)
                                            .getDocuments()
                                            .then(
                                          (querySnapshot) {
                                            if (querySnapshot
                                                    .documents.length !=
                                                0) {
                                              querySnapshot.documents.forEach(
                                                (result) {
                                                  srlno.add(srl);
                                                  itemList.add(
                                                      result.data['Item_Name']);
                                                  priceunit.add(
                                                      result.data['Price']);
                                                  quant.add(
                                                      int.parse(quantity.text));
                                                  amount.add((int.parse(
                                                          quantity.text) *
                                                      int.parse(result
                                                          .data['Price'])));
                                                  additemtotal(
                                                      (int.parse(quantity
                                                                  .text) *
                                                              int.parse(
                                                                  result.data[
                                                                      'Price']))
                                                          .toDouble(),
                                                      double.parse(
                                                          quantity.text));
                                                  rowList.add(DataRow(cells: [
                                                    DataCell(
                                                        Text(srl.toString())),
                                                    DataCell(Text(result
                                                        .data['Item_Name'])),
                                                    DataCell(Text(
                                                        result.data['Price'])),
                                                    DataCell(
                                                        Text(quantity.text)),
                                                    DataCell(Text((int.parse(
                                                                quantity.text) *
                                                            int.parse(result
                                                                .data['Price']))
                                                        .toString())),
                                                  ]));
                                                },
                                              );
                                              setState(() {
                                                srl++;
                                              });
                                            }
                                          },
                                        ).whenComplete(
                                          () {
                                            setState(
                                              () {
                                                loading = false;
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Add',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      color: Colors.orange,
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    loading
                                        ? CircularProgressIndicator()
                                        : Container(),
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
                                  style: TextStyle(fontSize: 18),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Item',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Unit Price',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Quantity',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Amount',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                          rows: rowList,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      elevation: 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 400,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ListTile(
                                                  leading: Text('Item Total'),
                                                  trailing: Text('Rs ' +
                                                      itemsum.toString()),
                                                ),
                                                ListTile(
                                                  leading: Text('Packaging'),
                                                  trailing: Text('Rs ' +
                                                      packing.toString()),
                                                ),
                                                ListTile(
                                                  leading: Text('GST @ 7%'),
                                                  trailing: Text('Rs ' +
                                                      gstCharge
                                                          .toStringAsFixed(2)),
                                                ),
                                                ListTile(
                                                  leading: Text('Grand Total'),
                                                  trailing: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    child: Text('Rs ' +
                                                        grandtot
                                                            .toStringAsFixed(
                                                                2)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 250,
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        controller: customer,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          focusColor: Colors.white,
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Customer Name',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 250,
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        controller: phoneNo,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone),
                                          focusColor: Colors.white,
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Phone Number',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(8),
                                      width: 200,
                                      alignment: Alignment.center,
                                      child: DropdownButton(
                                        value: type,
                                        focusColor: Colors.white,
                                        hint: Text('Payment Type'),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text('Cash'),
                                            value: 'Cash',
                                          ),
                                          // DropdownMenuItem(
                                          //   child: Text('UPI'),
                                          //   value: 'UPI',
                                          // ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            type = value;
                                          });
                                        },
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        setState(() {
                                          load = true;
                                        });
                                        load
                                            ? showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18)),
                                                  title: Text('Proccesing'),
                                                  content: Container(
                                                    height: 100,
                                                    width: 100,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12.0,
                                                          vertical: 35),
                                                      child:
                                                          LinearProgressIndicator(),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Text('');

                                        print('got2' + billno.toString());

                                        http.Response response =
                                            await http.post(
                                          'https://jsontopdfconverter.herokuapp.com/getPdf',
                                          headers: <String, String>{
                                            'Content-Type':
                                                'application/json; charset=UTF-8',
                                          },
                                          body: jsonEncode(
                                            <String, dynamic>{
                                              "bill_no": billno,
                                              "bill_to": customer.text,
                                              "mob_no": phoneNo.text,
                                              "sno": srlno,
                                              "item": itemList,
                                              "qty": quant,
                                              "priceu": priceunit,
                                              "gst":[],
                                              "amount": amount,
                                              "total_qty": quant.reduce(
                                                  (value, element) =>
                                                      value + element),
                                              "total_gst": 50,
                                              "total_amt": itemsum,
                                              "subtotal": itemsum + packing,
                                              "cgst": (gstCharge / 2)
                                                  .toStringAsFixed(2),
                                              "sgst": (gstCharge / 2)
                                                  .toStringAsFixed(2),
                                              "date": "12-07-2020",
                                              "total": grandtot,
                                            },
                                          ),
                                        );
                                        print(response.statusCode);
                                        billColRef
                                            .document(billno.toString())
                                            .setData({
                                          "bill_no": billno.toString(),
                                          "bill_to": customer.text.toString(),
                                          "mob_no": phoneNo.text.toString(),
                                          "sno": srlno,
                                          "item": itemList,
                                          "qty": quant,
                                          "priceu": priceunit,
                                          "amount": amount,
                                          "total_qty": quant.reduce(
                                              (value, element) =>
                                                  value + element),
                                          "total_amt": itemsum,
                                          "subtotal": itemsum + packing,
                                          "cgst": (gstCharge / 2)
                                              .toStringAsFixed(2),
                                          "sgst": (gstCharge / 2)
                                              .toStringAsFixed(2),
                                          "date": "12-07-2020",
                                          "total": grandtot,
                                        });
                                        await Printing.layoutPdf(
                                            onLayout: (_) =>
                                                response.bodyBytes);
                                        setState(() {
                                          srl = 1;
                                          load = false;
                                        });
                                        Navigator.of(context).pop();
                                        billno++;
                                        billColRef.document('info').updateData({
                                          "takeid": billno,
                                        });
                                        print('new' + billno.toString());
                                      },
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
        ],
      ),
    );
  }
}
