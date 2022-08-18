import 'package:chat/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

    'usuarios': (BuildContext context) => const UsuariosPage(),
    'chat'    : (BuildContext context) => const ChatPage(),
    'login'   : (BuildContext context) => const LoginPage(),
    'register': (BuildContext context) => const RegisterPage(),
    'loading' : (BuildContext context) => const LoadingPage(),

};