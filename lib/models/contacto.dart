class Contacto {
  int id;
  String nombre;
  String telefono;
  String email;

  Contacto({
    this.id = 0,
    required this.nombre,
    required this.telefono,
    required this.email,
  });

  factory Contacto.fromMap(Map<String, dynamic> map) => Contacto(
    id: map["id"],
    nombre: map["nombre"],
    telefono: map["telefono"],
    email: map["email"],
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "telefono": telefono,
    "email": email,
  };
}
