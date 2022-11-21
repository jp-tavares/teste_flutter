import 'package:flutter/material.dart';

class ExamesView extends StatelessWidget {
  final List exames = [
    {
      "id": 1,
      "paciente": "João Pedro",
      "status": "Processando",
      "data": "08/08/2022"
    },
    {
      "id": 2,
      "paciente": "Marcelo Miguel",
      "status": "Finalizado",
      "data": "09/08/2022"
    },
    {
      "id": 3,
      "paciente": "Marcos Pontes",
      "status": "Processando",
      "data": "05/08/2022"
    }
  ];

  ExamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/camera');
        },
        child: const Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: const Text('Exames'),
      ),
      body: ListView.builder(
        itemCount: exames.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // retorna um objeto do tipo Dialog
                  return AlertDialog(
                    title: Text('${exames[index]['paciente']}'),
                    content: Row(
                      children: [
                        const Text('Status: '),
                        Text(
                          '${exames[index]['status']}',
                          style: TextStyle(color: exames[index]['status'] == 'Finalizado' ? Colors.green : Colors.blue),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Fechar'),
                      ),
                    ],
                  );
                },
              );
            },
            title: Text(exames[index]['paciente']),
            subtitle: Text(exames[index]['status']),
            trailing: Text(exames[index]['data']),
          );
        },
      ),
    );
  }
}
