// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat/models/usuario.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {

    final bool ok;
    Usuario? usuarioDb;
    String? token;

    LoginResponse({
        required this.ok,
        this.usuarioDb,
        this.token,
    });



    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"] == null ? null : json["ok"],
        usuarioDb: json["usuarioDB"] == null ? null : Usuario.fromJson(json["usuarioDB"]),
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok == null ? null : ok,
        "usuarioDB": usuarioDb == null ? null : usuarioDb!.toJson(),
        "token": token == null ? null : token,
    };
}


