import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta (BuildContext context, String titulo, String subtitulo){

   if(!Platform.isAndroid){

      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(titulo),
          content: Text(subtitulo),
          actions: [
            MaterialButton(
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok') 
              )
          ],
        ),
      );

    }else{
       
       showCupertinoDialog(context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(titulo),
          content: Text(subtitulo),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            )
          ],
        ),
      );  

    }
}