import 'package:flutter/material.dart';
import '../service/abstract-api.dart'; // Import the API service

class ListaTransacoes extends StatefulWidget {
  @override
  _ListaTransacoesState createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  final AbstractApi _api = AbstractApi('transacoes');
  List<Map<String, dynamic>> transacoes = [];

  @override
  void initState() {
    super.initState();
    _loadTransacoes(); // Load data from API when the screen loads
  }

  void _loadTransacoes() async {
    final data = await _api.getAll();
    // Você precisa decodificar a string JSON da API para um Iterable
    setState(() {
      transacoes = List<Map<String, dynamic>>.from(json.decode(data)); // Decodificando a resposta JSON
    });
  }

  void _deleteTransacao(int id) async {
    await _api.deleteById(id);
    _loadTransacoes(); // Reload data after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Transações')),
      body: ListView.builder(
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          final transacao = transacoes[index];
          return ListTile(
            title: Text(transacao['descricao']),
            subtitle: Text('Valor: R\$ ${transacao['valor']}'),  // Corrigido escape do $
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Lógica para editar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTransacao(transacao['id']); // Call the delete function
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
