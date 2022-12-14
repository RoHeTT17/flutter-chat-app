import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid; //Si es el de nosotros significa que mandamos el mensaje
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.texto, 
    required this.uid, 
    required this.animationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: (uid == '123')
                ? _sendMessage() //myMessage
                : _recivedMessage(),//_notMyMessage,
        ),
      ),
    );
  }

  Widget _sendMessage() {

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        //El 50 es para que no se pegue a la orilla si fuera un texto muy largo
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        decoration: BoxDecoration(
          color:  const Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
  
  Widget _recivedMessage() {

   return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        //El 50 es para que no se pegue a la orilla si fuera un texto muy largo
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
        decoration: BoxDecoration(
          color:  const Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.black87),),
      ),
    );
  }
   
}