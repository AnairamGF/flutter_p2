import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  const Suma({super.key});

  @override
  State<Suma> createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  //es la variable que se usa para los textfields
  TextEditingController _numero1Controller = TextEditingController();
  TextEditingController _numero2Controller = TextEditingController();

  void _mostrarResultado(BuildContext context) {
    int numero1 = int.tryParse(_numero1Controller.text) ?? 0;
    int numero2 = int.tryParse(_numero2Controller.text) ?? 0;

    int suma = numero1 + numero2;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Resultado"),
            content: Text("La suma es: $suma"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suma de números"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            controller: _numero1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Número 1", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: _numero2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Número 2", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                _mostrarResultado(context);
              },
              child: Text("Resultado"))
        ],
      )),
    );
  }
}
