import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  final List<Map<String, dynamic>> transacoes = [
    {'descricao': 'Transação 1', 'valor': 100.0},
    {'descricao': 'Transação 2', 'valor': 50.0},
  ];

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
            subtitle: Text('Valor: R\$ ${transacao['valor']}'),
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
                    // Lógica para deletar via API
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
