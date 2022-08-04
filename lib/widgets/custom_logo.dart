import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String labelLogo;

  const Logo({Key? key, required this.labelLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: [
            Image.asset('assets/tag-logo.png'),
            const SizedBox(height: 20,),
            Text(labelLogo, style: const TextStyle(fontSize: 30),)
          ],
        ),
        
      ),
    );
  }
}