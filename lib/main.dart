import 'package:flutter/material.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayatKonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //widget dinamis dapat dirubah kapanpun
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputController = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamor = 0;

  var listItem = ["Kelvin", "Reamur"]; //list of object buat map
  //list mulai dari index ke 0
  //list.length – 1 adalah index nilai terakhir dari sebuat list
  String _newValue = "Kelvin";
  double _result = 0;

  List<String> listViewItem = List<String>();
  final konvertHandler = Function;

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController
          .text); //penerimaan input user berupa string diubah ke double (parse)
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else //reamur
        _result = (4 / 5) * _inputUser;
      listViewItem.add("$_newValue : $_result"); //penambahan list untuk riwayat
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          //margin LTRB , klo hanya satu pake only atau valuenya 0
          //seperti line 69
          child: Column(
            children: [
              Input(inputController: inputController),
              buildDropdownButton(),
              Result(result: _result),
              Convert(konvertHandler: perhitunganSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                //memperluas children column di ruang yang tersissa
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        //penambahan di list riwayat
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: dropdownOnChanged, //extract method dibawah
    );
  }

  void dropdownOnChanged(String changeValue) {
    //terima parameter dari onchanged
    //tipenya string karena baris 83 dn 81
    //changevalue dpt dari dropdownonChanged
    setState(() {
      //mulai build lagii
      _newValue = changeValue;
      perhitunganSuhu(); //behaviour button pada dropdown
      //jadi setelah dropdown diubah akan lgsng tambah ke riwayat
    });
  }
}
