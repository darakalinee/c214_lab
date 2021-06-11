import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final salarioController = TextEditingController();
  final aumentoController = TextEditingController();
  final novoSalController = TextEditingController();

  double doubleSalario, doubleAumento;

  void _clearAll() {
    salarioController.text = "";
    aumentoController.text = "";
    novoSalController.text = "";
  }

  _aumentoNormal() {
    if (salarioController.text.isEmpty || aumentoController.text.isEmpty) {
      _clearAll();
      return;
    }
    doubleSalario = double.parse(salarioController.text);
    doubleAumento = double.parse(aumentoController.text);
    novoSalController.text =
        ((doubleSalario + doubleAumento).toStringAsFixed(2));
  }

  _aumentoPorcentagem() {
    if (salarioController.text.isEmpty || aumentoController.text.isEmpty) {
      _clearAll();
      return;
    }
    doubleSalario = double.parse(salarioController.text);
    doubleAumento = double.parse(aumentoController.text);
    novoSalController.text =
        (doubleSalario + (doubleSalario * doubleAumento / 100))
            .toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.attach_money, size: 120.0, color: Colors.amber),
              SizedBox(
                height: 8,
              ),
              buildTextField("Salário", "R\$ ", salarioController),
              SizedBox(
                height: 12,
              ),
              buildTextField("Aumento", "", aumentoController),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        _aumentoNormal();
                      },
                      child: Text(
                        "Normal",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        _aumentoPorcentagem();
                      },
                      child: Text(
                        "Porcentagem",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              buildTextField("Novo Salário", "R\$ ", novoSalController),
              SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      _clearAll();
                    },
                    child: Text(
                      "Limpar",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(color: Colors.amber, fontSize: 22.0),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
