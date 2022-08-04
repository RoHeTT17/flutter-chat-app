import 'package:flutter/material.dart';

import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_buttom.dart';
import 'package:chat/widgets/cutom_labels.dart';

class LoginPage extends StatelessWidget {
 
  const LoginPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height *0.9 ,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            
            /*child: ConstrainedBox(
               constraints: BoxConstraints( minHeight: 450),
               child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const  [
                                                Logo(),
                                                _Form(),
                                                Labels()
                                            ],
                          ),
            ),*/
        
             child: SizedBox(
               //margin: EdgeInsets.symmetric(vertical: 5),
               //height: MediaQuery.of(context).size.height *0.9 ,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                                 Logo(labelLogo:'Messenger'),
                                 _Form(),
                                 Labels(route: 'register', question: '¿No tienes cuenta?', title:   'Crea una ahora')
                               ],
               ),
             ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormStateState();
}

class __FormStateState extends State<_Form> {
  @override
  Widget build(BuildContext context) {

    final emailCtrl = TextEditingController();
    final pswdCtrl  = TextEditingController();

    return Container(
      margin:  const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            icon: Icons.mail_lock_outlined,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textController: pswdCtrl,
            isPassword: true,
          ),

          
          CustomButtom(
            labelButtom: 'Ingresar',
            functionButtom: (){
              print('email' + emailCtrl.text);
              print('pwd ${pswdCtrl.text}');
            },
          ),

        ],
      ),
    );
  }
}


