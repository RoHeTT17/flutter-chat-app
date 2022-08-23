//Solo hay métodos estativos

import 'dart:io';

class Enviroment{

  //En android no se puede usar localhost, pero en IOS si

  static String apiUrl   = Platform.isAndroid ? 'http://172.16.2.25:3000/api' : 'http://localhost:3000/api';
  static String soketUrl = Platform.isAndroid ? 'http://172.16.2.25:3000/' : 'http://localhost:3000';

}