import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_services.dart';


class UsuariosPage extends StatefulWidget {
 
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
 
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
     Usuario(uid: '1', nombre: 'Tete',      email: 'test1@test.com',online: true),
     Usuario(uid: '2', nombre: 'Menish',    email: 'test2@test.com',online: false),
     Usuario(uid: '3', nombre: 'Juan',      email: 'test3@test.com',online: true),
     Usuario(uid: '4', nombre: 'Merengues', email: 'test4@test.com',online: true),
  ];
 
  @override
  Widget build(BuildContext context) {

    final authServices = Provider.of<AuthServices>(context);  

    return Scaffold(
      appBar: AppBar(
        title: Text(authServices.usuario!.nombre, style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
                          icon: const Icon(Icons.exit_to_app,color: Colors.black87), 
                          onPressed: () {  
                              //TODO: Desconectarnos del socketserver
                              
                              //1. Mandar al Login
                              Navigator.pushReplacementNamed(context, 'login'); 
                              
                              //2. Borrar Token
                              AuthServices.deleteToken();
                          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle,color: Colors.blue[400],),
                   //Icon(Icons.offline_boltolor: Colors.red,),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400],),
            waterDropColor: Colors.blue,
        ),
        onRefresh: _cargarUsuarios,
        child: _ListViewUsuarios(usuarios: usuarios)
        )
   );
  }

  _cargarUsuarios() async{

    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

}

class _ListViewUsuarios extends StatelessWidget {
  const _ListViewUsuarios({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int index) => _UsuarioListTile(usuario: usuarios[index]),
      /*{ 
       return _usuarioListTile(usuario: usuarios[index]);
      }, */
      separatorBuilder: (BuildContext context, int index) { 
          return const Divider(height: 2, color: Colors.blue,);
      },
      
      
    );
  }
  
}

class _UsuarioListTile extends StatelessWidget {

  final Usuario usuario;

  const _UsuarioListTile({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
                     title: Text(usuario.nombre),
                     subtitle: Text(usuario.email),
                     leading: CircleAvatar(backgroundColor: Colors.blue[100],child: Text(usuario.nombre.substring(0,2)),),
                     trailing: Container(
                          width:  10,
                          height: 10,
                          decoration: BoxDecoration(
                           color: usuario.online ? Colors.green[300] : Colors.red,
                           borderRadius: BorderRadius.circular(100)
                          ),   
                     ),
                     
                   );
  }
}