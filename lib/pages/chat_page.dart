import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
 
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
 
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [];

  bool _isWritting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              maxRadius: 14 ,
              child: Text('Test', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
            ),
            SizedBox(height: 2,),
            Text('Tete', style: TextStyle(color: Colors.black87, fontSize: 12),)
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                    child: ListView.builder(
                      itemCount: _messages.length,
                      reverse: true,
                      physics:  const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) { 
                        //return Text('$index'); 
                        return _messages[index]; 
                      },
                      )
                    ),
                    
                    const Divider(height: 1, color: Colors.blue,),

                    Container(
                      color: Colors.white,
                      //height: 100,
                      child: _inputChat(),
                    )

          ],
        ),
      ),
     );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(child: TextField(
                                      controller: _textController,
                                      onSubmitted: _handleSubmit,

                                      onChanged: (String texto){
                                        setState(() {
                                           if (texto.trim().length >0) //Esta escribiendo
                                              _isWritting = true;
                                           else
                                              _isWritting = false;   

                                        });
                                      },
                                      decoration: const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                                      focusNode: _focusNode,
                                     )
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                     ? CupertinoButton(
                                        child: const Text('Enviar'), 
                                        onPressed: _isWritting
                                        ? () => _handleSubmit(_textController.text).trim()
                                        : null,
                                      )
                     : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                                            highlightColor: Colors.transparent, //Quitar el efecto del material
                                            splashColor:  Colors.transparent,//Quitar el efecto del material
                                            icon: const Icon(Icons.send,),
                                            onPressed: _isWritting
                                                      ? () => _handleSubmit(_textController.text.trim())
                                                      : null,
                                           ),
                        ),
                     )
            )
          ],
        ),
      )
    );
  }

  _handleSubmit(String texto){
    //print(texto);

    if (texto.length == 0) return;

    final newMessage =  ChatMessage(
                                      texto: texto, 
                                      uid: '123',
                                      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200)) ,);

    setState(() {
      //Agregar el nuevo mensaje al arreglo, en la posición 0 para que sea el que se muestra abajo
      _messages.insert(0, newMessage);
      newMessage.animationController.forward();

      _textController.clear();
      _focusNode.requestFocus();
      _isWritting = false;
    });

  }

  @override
  void dispose() {
    
    //Limpiar para liberar recursos
    //TODO: Limpiar Off del Socket
    
    for (ChatMessage message in _messages){
      message.animationController.dispose();
    }

    super.dispose();
  }

}