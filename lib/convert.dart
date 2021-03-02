import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  //widget statis
  final Function konvertHandler;
  //final : inisiasi variabel immutable yang mana nilai variabelnya sudah atau belum diketahui pada saat kompilasi berjalan
  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}
