import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_realtimedb/ttgecmis.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTarihnem extends StatefulWidget {
  const ListTarihnem({Key key}) : super(key: key);

  @override
  _ListTarihnemState createState() => _ListTarihnemState();
}

class _ListTarihnemState extends State<ListTarihnem> {
  List<dynamic> searchResults = [];
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
  }
  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[500],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Eco-Guardian',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Text(
              'Kayıt Edilen Verilere Göre Tarihsel Sorgu',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  _selectDate(_startDateController);
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: _startDateController,
                    decoration: InputDecoration(
                      hintText: 'Başlangıç Tarihi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                      filled: true,
                      fillColor: Colors.lightGreen[400],
                      suffixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  _selectDate(_endDateController);
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: _endDateController,
                    decoration: InputDecoration(
                      hintText: 'Bitiş Tarihi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                      filled: true,
                      fillColor: Colors.lightGreen[400],
                      suffixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _searchFirebase();
                },
                child: Text('Ara'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 10.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      searchResults[index]['date'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Saat: ${searchResults[index]['time']}, Nem: ${searchResults[index]['value']}%',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchFirebase() {
    String startDate = _startDateController.text;
    String endDate = _endDateController.text;

    _databaseReference.child('test/json/history2nemkayit').once().then((DataSnapshot snapshot) {
      List<dynamic> results = [];
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        if (value['date'] != null && value['date'] != '') {
          DateTime date = DateTime.parse(value['date']);
          DateTime start = DateTime.parse(startDate);
          DateTime end = DateTime.parse(endDate);
          if (date.isAfter(start.subtract(Duration(days: 1))) && date.isBefore(end.add(Duration(days: 1)))) {
            results.add(value);
          }
        }
      });
      setState(() {
        searchResults = results;
      });
    });
  }
}
