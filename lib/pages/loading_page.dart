import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_services.dart';

class LoadingPage extends StatelessWidget {
 
  const LoadingPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          return  const Center(
                        child:  Text('Cargando...'),
                        );
        }),
     
   );
  }

  Future checkLoginState(BuildContext context) async{

    final authService = Provider.of<AuthServices>(context, listen:false);

    final autenticado = await authService.isLoggedIn();

    if(autenticado){
      //TODO: Conectar al soketServer
      //De esta forma funciona, pero se mira muy brusco el cambio entre pantallas
      //Navigator.restorablePushReplacementNamed(context, 'usuarios');
      //Para dar una especide animación (se puede agregar animaciones realmente)
      Navigator.pushReplacement(
                                 context,
                                 PageRouteBuilder(
                                                   pageBuilder: ( _, __, ___) => const UsuariosPage(),
                                                   transitionDuration: const Duration(milliseconds: 0)
                                                 )
                              );


    }else{
       //Navigator.restorablePushReplacementNamed(context, 'login');
             Navigator.pushReplacement(
                                 context,
                                 PageRouteBuilder(
                                                   pageBuilder: ( _, __, ___) => const LoginPage(),
                                                   transitionDuration: const Duration(milliseconds: 0)
                                                 )
                              );
    }  

  }


}