import 'package:flutter/material.dart';

import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_buttom.dart';
import 'package:chat/widgets/cutom_labels.dart';

class RegisterPage extends StatelessWidget {
 
  const RegisterPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height *0.9 ,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
        
             child: SizedBox(
               //margin: EdgeInsets.symmetric(vertical: 5),
               //height: MediaQuery.of(context).size.height *0.9 ,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   const [
                                    Logo(labelLogo: 'Registro'),
                                    _Form(),
                                    Labels(route: 'login', question: '¿Tienes una cuenta?', title:   'Iniciar ahora')
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

    final nameCtrl  = TextEditingController();
    final emailCtrl = TextEditingController();
    final pswdCtrl  = TextEditingController();

    return Container(
      margin:  const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textController: nameCtrl,
          ),

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