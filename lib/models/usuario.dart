// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  
    final String nombre;
    final String email;
    final bool online;
    final String uid;

    Usuario({
        required this.nombre,
        required this.email,
        required this.online,
        required this.uid,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"] == null ? null : json["nombre"],
        email: json["email"] == null ? null : json["email"],
        online: json["online"] == null ? null : json["online"],
        uid: json["uid"] == null ? null : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre == null ? null : nombre,
        "email": email == null ? null : email,
        "online": online == null ? null : online,
        "uid": uid == null ? null : uid,
    };
}
