import 'package:flutter/material.dart';
import '../service/abstract-api.dart'; // Import the API service

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final AbstractApi _api = AbstractApi('transacoes'); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Transações')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _textoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira uma descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Por favor insira um valor numérico';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> data = {
                      'descricao': _textoController.text,
                      'valor': double.parse(_numeroController.text)
                    };

                    // Call the API to save the data
                    await _api.post(data);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Transação salva com sucesso!'))
                    );
                    Navigator.pop(context); // Close the form after saving
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
