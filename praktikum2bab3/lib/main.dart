import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamor = 0, input = 0;

  konversi() {
    setState(() {
      input = double.parse(text1.text);
      kelvin = input + 273;
      reamor = input * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Konversi Suhu')),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputSuhu(text1: text1),
              Hasil(kelvin: kelvin, reamor: reamor),
              konvertbutton(text1: text1, konversi: konversi)
            ],
          ),
        ),
      ),
    );
  }
}

class konvertbutton extends StatelessWidget {
  konvertbutton({
    Key key,
    this.text1,
    this.konversi,
  }) : super(key: key);

  final TextEditingController text1;
  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          konversi();
          text1.clear();
        },
        child: Text(
          "Konversi",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key key,
    this.text1,
  }) : super(key: key);

  final TextEditingController text1;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: text1,
        decoration: InputDecoration(hintText: "Masukkan Suhu"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ]);
  }
}

class Hasil extends StatelessWidget {
  const Hasil({
    Key key,
    this.kelvin,
    this.reamor,
  }) : super(key: key);

  final double kelvin;
  final double reamor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Suhu Dalam Kelvin",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "$kelvin",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Suhu Dalam Reamor",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "$reamor",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}
