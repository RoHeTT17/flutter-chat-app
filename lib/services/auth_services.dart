
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/globals/envioroment.dart';

class AuthServices with ChangeNotifier{

  Usuario? usuario;//Data del información conectado
  bool _autenticando = false;
  String? _msgError;
  
  /*******
  String? _user;
  String? _pwd;
    
  String? get getUser => this._user;
  String? get getPwd => this._pwd;
  ***********/

  String? get getMsgError => _msgError;


  // Create storage
  final _storage = new FlutterSecureStorage();

  bool get getAutenticando => this._autenticando;

  set setAutenticando( bool value) {

    _autenticando = value;

    notifyListeners();
  }

   //Getter del token de forma estatica

   //Es Future porque la lectura no es asincrona
   static Future<String?> getToken() async{
    //Como es static no se tiene acceso a las propiedades de la clase, por eso,
    //se vuelve a crear
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');

    return token;

   }

   static Future<void> deleteToken() async{
    //Como es static no se tiene acceso a las propiedades de la clase, por eso,
    //se vuelve a crear
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
    
   }

  Future<bool> login(String email, String password) async {

      setAutenticando = true;
      
      //Aramar el payload, las propeidades deben ser iguales a como se resuelven
      final data = {
        'email' : email,
        'password' : password
      };

      final resp = await http.post( Uri.parse('${Enviroment.apiUrl}/login'),
        body: jsonEncode(data),
        headers: {
          'Content-Type' : 'application/json'
        }
      );

     setAutenticando = false;

      if(resp.statusCode == 200){

        final loginResponse = loginResponseFromJson(resp.body);
        
        usuario = loginResponse.usuarioDb!;

        _guardarToken(loginResponse.token!);

        return true;   
      
      }else{


        return false;

      }
      
   }

  Future<bool> register(String nombre,String email, String password) async {

   setAutenticando = true;

    final data = {
      'nombre' : nombre,
      'email' : email,
      'password' : password

    };

    //Petición 

     //print('${Enviroment.apiUrl}/login/new');
    final resp = await http.post(
                                Uri.parse('${Enviroment.apiUrl}/login/new'), 
                                body: jsonEncode(data),
                                headers: {'Content-Type' : 'application/json'}
                                );
    setAutenticando = false;

    if(resp.statusCode == 200){ 

      final dataUsuario = loginResponseFromJson(resp.body);
    
      usuario = dataUsuario.usuarioDb!;
      _guardarToken(dataUsuario.token!);
   
      return true;

    }else{
      //Leer el json
      final errors = jsonDecode(resp.body);  

      _msgError = errors['msg'];

      return false; 

    }

  }

  Future<bool> isLoggedIn () async{

    final token = await _storage.read(key: 'token') ?? '';

    final resp = await http.get(
                                Uri.parse('${Enviroment.apiUrl}/login/renew'), 
                                headers: {
                                          'Content-Type': 'application/json',
                                          'x-token'     : token
                                          }
                                );

    if(resp.statusCode == 200){ 

      final dataUsuario = loginResponseFromJson(resp.body);
    
      usuario = dataUsuario.usuarioDb!;
      //Guardar un nuebo token (es para estar refrescando)
      await _guardarToken(dataUsuario.token!);
   
      return true;

     }else{
         logout();
        return false;
     }
  }

  Future _guardarToken (String token) async{
     return await _storage.write(key: 'token', value: token);
  }

  Future logout() async{
    //Borrar token al salir
    return await _storage.delete(key: 'token');
  }

}