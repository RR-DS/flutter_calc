import 'package:flutter/material.dart';
import 'segunda_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _resultado = 0;
  final _numero1Controller = TextEditingController();
  final _numero2Controller = TextEditingController();
  @override
  void dispose() {
    _numero1Controller.dispose();
    _numero2Controller.dispose();
    super.dispose();
  }

  void _soma() {
    setState(() {
      this._resultado = int.parse(_numero1Controller.text) +
          int.parse(_numero2Controller.text);
    });
  }

  void _sub() {
    setState(() {
      this._resultado = int.parse(_numero1Controller.text) -
          int.parse(_numero2Controller.text);
    });
  }

  void _mult() {
    setState(() {
      this._resultado = int.parse(_numero1Controller.text) *
          int.parse(_numero2Controller.text);
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SegundaTela(this._resultado)));
  }

  void _div() {
    setState(() {
      this._resultado = int.parse(_numero1Controller.text) ~/
          int.parse(_numero2Controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Text("Número 1:"),
              Expanded(
                  child: TextField(controller: _numero1Controller)) // Expanded
            ] // children
                ), // Row
            Row(children: [
              Text("Número 2:"),
              Expanded(child: TextField(controller: _numero2Controller))
            ]), // Row
            Row(children: [Text("Resultado: ${_resultado}")]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _soma, child: Icon(Icons.add)),
                ElevatedButton(onPressed: _sub, child: Icon(Icons.remove)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _mult, child: Icon(Icons.close)),
                ElevatedButton(onPressed: _div, child: Icon(Icons.percent))
              ],
            )
          ], // <Widget>[]
        ), // Column
      ), // Center
    ); // Scaffold
  } // build()
}
