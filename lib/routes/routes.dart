import 'package:chat/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

    'usuarios': (BuildContext) => const UsuariosPage(),
    'chat'    : (BuildContext) => const ChatPage(),
    'login'   : (BuildContext) => const LoginPage(),
    'register': (BuildContext) => const RegisterPage(),
    'loading' : (BuildContext) => const LoadingPage(),

};