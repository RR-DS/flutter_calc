import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  final int _resultado;
  SegundaTela(this._resultado);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela Linda"),
      ),
      body: Center(
          child: Column(
        children: [
          Row(children: [Text("Resultado: ${_resultado}")]),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.add)),
        ],
      )),
    );
  }
}
