import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> contactos = [
    "Juan Rojas",
    "Rosario Castro",
    "Lucía Ramírez",
  ];

  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestión de contactos")),
      body: Column(
        children: [
          Text(
            "Listado de contactos",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(
                      labelText: "Nombre del contacto",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    print("Nombre ingresado.");
                    print(_nombreController.text);
                    contactos.add(_nombreController.text.trim());
                    print("Listado de contactos");
                    print(contactos);
                  },
                  child: Text("Agregar"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: contactos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person_3),
                  title: Text(contactos[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
