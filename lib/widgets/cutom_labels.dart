import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String question;
  final String title;
  final String route;

  const Labels({Key? key, required this.route, required this.question, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:  [
                     Text(question, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),),
                     const SizedBox(height: 10,),
                     GestureDetector(
                        child: Text(title, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),),
                        onTap:(){
                           Navigator.pushReplacementNamed(context, route);
                        }
                     ),
                     
                     const Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200),),
                   ],
      ),
    );
  }
}