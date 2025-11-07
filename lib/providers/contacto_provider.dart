import 'package:contactos/models/contacto.dart';
import 'package:contactos/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ContactoProvider extends ChangeNotifier {
  List<Contacto> contactos = [];

  listar() async {
    final datos = await DbProvider.db.listadoContactos();
    contactos = [...?datos];
    notifyListeners();
  }

  nuevo(String nombre, String telefono, String email) async {
    final nuevoContacto = Contacto(
      nombre: nombre,
      telefono: telefono,
      email: email,
    );
    final nuevoId = await DbProvider.db.nuevoContacto(nuevoContacto);
    nuevoContacto.id = nuevoId;
    contactos.add(nuevoContacto);
    notifyListeners();
  }
}
