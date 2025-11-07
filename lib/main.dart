import 'package:contactos/providers/contacto_provider.dart';
import 'package:contactos/screens/registro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ContactoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegistroScreen(),
        title: "Gestión de contactos",
      ),
    );
  }
}
