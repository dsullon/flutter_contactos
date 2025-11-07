import 'package:contactos/models/contacto.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final List<Contacto> contactos = [
    Contacto(
      nombre: "Juan Rojas",
      telefono: "987654321",
      email: "jrojas@prueba.test",
    ),
    Contacto(
      nombre: "Rosario Castro",
      telefono: "998765432",
      email: "rcastro@prueba.test",
    ),
    Contacto(
      nombre: "Lucía Ramírez",
      telefono: "999876543",
      email: "lramirez@prueba.test",
    ),
  ];

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _mostrarFormulario() {
    _nombreController.clear();
    _telefonoController.clear();
    _emailController.clear();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Registro de contacto"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Nombres"),
              controller: _nombreController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Teléfono"),
              controller: _telefonoController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _agregar();
                Navigator.pop(context);
              },
              child: Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }

  void _agregar() {
    final nombre = _nombreController.text.trim();
    final telefono = _telefonoController.text.trim();
    final email = _emailController.text.trim();

    if (nombre.isEmpty || telefono.isEmpty || email.isEmpty) return;
    setState(() {
      contactos.add(Contacto(nombre: nombre, telefono: telefono, email: email));
      _nombreController.clear();
      _telefonoController.clear();
      _emailController.clear();
    });
  }

  void _eliminar(int index) {
    setState(() {
      contactos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Icon(Icons.person_pin_rounded),
          title: Text("Gestión de contactos"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Agregar contacto",
        onPressed: () => _mostrarFormulario(),
        child: Icon(Icons.add_circle, size: 35.0, color: Colors.brown.shade900),
      ),
      body: Column(
        children: [
          Text(
            "Listado de contactos",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: contactos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    contactos[index].nombre,
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone_android),
                          Text(contactos[index].telefono),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Icon(Icons.email),
                          Text(contactos[index].email),
                        ],
                      ),
                    ],
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      _eliminar(index);
                    },
                    child: Icon(Icons.delete_forever, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
