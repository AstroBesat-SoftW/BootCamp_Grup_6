
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';


import 'package:charts_flutter/flutter.dart' as charts;

class VeriGecisnem extends StatefulWidget {
  @override
  _VeriGecisnemState createState() => _VeriGecisnemState();
}

class _VeriGecisnemState extends State<VeriGecisnem> {
  final databaseReference = FirebaseDatabase.instance.reference();

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
              'Kayıt Edilen Verilere Göre Nem Grafiği',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: databaseReference.child('test/json/history2nemkayit').onValue,
        builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
            List<double> yveriler = [];
            List<DateTime> xveriler = [];
            values.forEach((key, value) {
              Map<dynamic, dynamic> nestedValues = value;
              String dateStr = nestedValues["date"] + " " + nestedValues["time"];
              DateTime date = DateTime.parse(dateStr);
              double val = double.parse(nestedValues["value"].toString());
              xveriler.add(date);
              yveriler.add(val);
            });

            List<charts.Series<Veri, DateTime>> seriesList = [
              charts.Series<Veri, DateTime>(
                id: 'Değerler',
                colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                domainFn: (Veri veri, _) => veri.tarihSaat,
                measureFn: (Veri veri, _) => veri.deger,
                data: List.generate(
                  xveriler.length,
                      (index) => Veri(xveriler[index], yveriler[index]),
                ),
              ),
            ];

            return Container(
              child: Center(
                child: charts.TimeSeriesChart(
                  seriesList,
                  animate: true,
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(zeroBound: false),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class Veri {
  final DateTime tarihSaat;
  final double deger;

  Veri(this.tarihSaat, this.deger);
}

