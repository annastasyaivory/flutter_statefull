import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  //widget statis
  const Input({
    //const : inisiasi variabel immutable yang mana nilai variabelnya sudah diketahui pada saat kompilasi berjalan
    Key key,
    @required this.inputController,
  }) : super(key: key);
  final TextEditingController inputController;
  //final : inisiasi variabel immutable yang mana nilai variabelnya sudah atau belum diketahui pada saat kompilasi berjalan
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"), //hint text
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ], //validasi hanya angka
      controller: inputController,
      keyboardType: TextInputType.number,
    );
  }
}
