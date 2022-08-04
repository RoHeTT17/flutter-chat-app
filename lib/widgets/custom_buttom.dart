import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {

  final String labelButtom;
  final Color  colorButtom;
  final Function() functionButtom;

  const CustomButtom({
    Key? key, required this.labelButtom, this.colorButtom = Colors.blue, required this.functionButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: colorButtom,
      shape: const StadiumBorder(),
      onPressed: functionButtom, 
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(labelButtom, style: const TextStyle(color: Colors.white,fontSize: 17,),
        ),
      ),
    ));
  }
}